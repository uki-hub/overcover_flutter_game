// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:bloc/bloc.dart';
import 'package:overcover/app/cache.dart';

import 'package:overcover/controller/cubit/players_cubit.dart';
import 'package:overcover/controller/cubit/word_list_cubit.dart';
import 'package:overcover/data/models/lobby/game_setting.dart';
import 'package:overcover/data/models/play/game_history.dart';
import 'package:overcover/data/models/play/game_player.dart';
import 'package:overcover/data/models/play/voting_stat.dart';
import 'package:overcover/data/models/player/player.dart';
import 'package:overcover/data/models/role/passive_roles.dart';
import 'package:overcover/lib/game_engine.dart';
import "package:collection/collection.dart";

part 'play_state.dart';

const _getJusticeKey = 'PlayCubit;GetJustice';
const _getMimeKey = 'PlayCubit;GetMime';

class PlayCubit extends Cubit<PlayState> {
  final GameEngine gameEngine = GameEngine();
  final WordListCubit wordListCubit;
  final PlayersCubit playersCubit;

  PlayCubit({
    required List<Player> players,
    required GameSetting setting,
    required this.wordListCubit,
    required this.playersCubit,
  }) : super(PrepareGame(
          players: players,
          alivePlayers: [],
          deathPlayers: [],
          gameHistories: [],
          gameSetting: setting,
        )) {
    _prepareGame();
  }
  //=== PUBLIC ===
  //PLAYER
  GamePlayer get getJustice => _getGamePlayerRole(cacheKey: _getJusticeKey, role: EnumPassiveRole.justice, includeDeathPlayers: state.gameSetting.justiceCanVoteAfterBeingVoted);
  GamePlayer get getMime => _getGamePlayerRole(cacheKey: _getMimeKey, role: EnumPassiveRole.mime);

  //PREPARE
  void nextPlayerToGetWord() {
    final _state = state as PlayerGetWordAndRole;

    final nextPlayerIndex = _state.playerIndex + 1;

    if (nextPlayerIndex < _state.alivePlayers.length) {
      emit(_state.copyWith(
        playerIndex: nextPlayerIndex,
        isSeen: false,
      ));
    } else {
      emit(PlayerSayTheirWordClue(
        alivePlayers: _state.alivePlayers,
        deathPlayers: _state.deathPlayers,
        gameHistories: _state.gameHistories,
        gameSetting: _state.gameSetting,
      ));
    }
  }

  void playerSeeTheWord() => emit((state as PlayerGetWordAndRole).copyWith(isSeen: true));

  //VOTING
  void startVoting() => emit(PlayerToVoting(
        playerIndex: 0,
        votingStats: [],
        alivePlayers: state.alivePlayers,
        deathPlayers: state.deathPlayers,
        gameHistories: state.gameHistories,
        gameSetting: state.gameSetting,
      ));

  void playerVote({required GamePlayer player, GamePlayer? voteWho}) {
    final _state = (state as PlayerToVoting);

    if (voteWho != null) {
      final updatedVotingStats = _state.votingStats.toList();
      final votedPlayerIndex = updatedVotingStats.indexWhere((e) => e.votedPlayer.player.id == voteWho.player.id);

      if (votedPlayerIndex == -1) {
        updatedVotingStats.add(VotingStat(
          votedPlayer: voteWho,
          votedBys: [player],
        ));
      } else {
        updatedVotingStats[votedPlayerIndex].votedBys.add(player);
      }

      emit(_state.copyWith(votingStats: updatedVotingStats));
    }
  }

  void nextPlayerToVoting() {
    final _state = state as PlayerToVoting;

    final nextPlayerIndex = _state.playerIndex + 1;

    if (nextPlayerIndex < _state.alivePlayers.length) {
      emit(_state.copyWith(playerIndex: nextPlayerIndex));
    } else {
      _postVotingSection();
    }
  }

  void votePlayer({required GamePlayer votedPlayer}) {
    final _state = state as Voting;

    emit(VotingResult(
      votedPlayer: votedPlayer,
      votingStats: _state.votingStats,
      alivePlayers: _state.alivePlayers,
      deathPlayers: _state.deathPlayers,
      gameHistories: _state.gameHistories,
      gameSetting: _state.gameSetting,
    ));

    _postVotedPlayerSection(votedPlayer: votedPlayer);
  }

  //=== PRIVATE ===
  void _prepareGame() {
    final _state = state as PrepareGame;

    final word = wordListCubit.getWord();

    final gameModel = gameEngine.prepareGame(
      word: word,
      setting: _state.gameSetting,
      players: _state.players,
    );

    emit(PlayerGetWordAndRole(
      playerIndex: 0,
      isSeen: false,
      alivePlayers: gameModel.gamePlayers,
      deathPlayers: _state.deathPlayers,
      gameHistories: _state.gameHistories,
      gameSetting: _state.gameSetting,
    ));
  }

  void _postVotingSection() {
    final _state = (state as PlayerToVoting);

    final votingStats = gameEngine.calculateVoting(votingStats: _state.votingStats);

    if (votingStats.length == 1) {
      //VOTE/KICK PLAYER FROM GAME
      emit(VotingResult(
        votedPlayer: votingStats[0].votedPlayer,
        votingStats: _state.votingStats,
        alivePlayers: _state.alivePlayers,
        deathPlayers: _state.deathPlayers,
        gameHistories: _state.gameHistories,
        gameSetting: _state.gameSetting,
      ));
    } else if (votingStats.length > 1) {
      if (_state.gameSetting.justiceIsComputer) {
        _computerJusticeVote(votingStats: votingStats);
      } else {
        emit(JusticeVotePlayer(
          justice: getJustice,
          votingStats: _state.votingStats,
          alivePlayers: _state.alivePlayers,
          deathPlayers: _state.deathPlayers,
          gameHistories: _state.gameHistories,
          gameSetting: _state.gameSetting,
        ));
      }
    }
  }

  void _computerJusticeVote({required List<VotingStat> votingStats}) {
    final _state = (state as PlayerToVoting);

    final playersToBeJusticed = votingStats.map((e) => e.votedPlayer).toList();

    final justicedPlayers = gameEngine.computerJustice(players: playersToBeJusticed);

    emit(ComputerJusticeVotePlayer(
      justicedPlayers: justicedPlayers,
      votingStats: _state.votingStats,
      alivePlayers: _state.alivePlayers,
      deathPlayers: _state.deathPlayers,
      gameHistories: _state.gameHistories,
      gameSetting: _state.gameSetting,
    ));
  }

  void _postVotedPlayerSection({required GamePlayer votedPlayer}) {
    final playerRoleName = votedPlayer.passiveRole?.name;

    if (playerRoleName == EnumPassiveRole.assasin.toString()) {
      emit(Assasin(
        assasin: votedPlayer,
        alivePlayers: state.alivePlayers,
        deathPlayers: state.deathPlayers,
        gameHistories: state.gameHistories,
        gameSetting: state.gameSetting,
      ));
    } else if (playerRoleName == EnumPassiveRole.couple.toString()) {}
  }

  GamePlayer _getGamePlayerRole({
    required String cacheKey,
    required EnumPassiveRole role,
    bool includeDeathPlayers = false,
  }) {
    GamePlayer? player = AppCache().get<GamePlayer?>(cacheKey);

    if (player == null) {
      final players = state.alivePlayers.toList();

      if (includeDeathPlayers) {
        players.addAll(state.deathPlayers);
      }

      player = players.firstWhere((e) => e.passiveRole?.name == role.toString());

      AppCache().set(cacheKey, player);
    }

    return player;
  }
}
