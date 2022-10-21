import 'dart:ffi';
import 'dart:math';

import 'package:overcover/app/cache.dart';
import 'package:overcover/data/models/game_engine/game_model.dart';
import 'package:overcover/data/models/game_engine/game_word.dart';
import 'package:overcover/data/models/lobby/game_setting.dart';
import 'package:overcover/data/models/play/game_player.dart';
import 'package:overcover/data/models/play/voting_stat.dart';
import 'package:overcover/data/models/player/player.dart';
import 'package:overcover/data/models/role/main_role.dart';
import 'package:overcover/data/models/role/main_roles.dart';
import 'package:overcover/data/models/role/passive_role.dart';
import 'package:overcover/data/models/role/passive_roles.dart';
import 'package:overcover/data/models/word.dart';
import 'package:overcover/enums/role_enums.dart';
import "package:collection/collection.dart";
import 'dart:math' as Math;

class GameEngine {
  GameEngine.__();

  static final GameEngine _ = GameEngine.__();

  factory GameEngine() => _;

  //=== PUBLIC ===
  GameModel prepareGame({required Word word, required GameSetting setting, required List<Player> players}) {
    final preparedWord = _prepareWord(word);

    final preparedPlayers = _preparePlayers(
      goodWord: preparedWord.goodWord,
      badWord: preparedWord.badWord,
      setting: setting,
      players: players,
    );

    return GameModel(gamePlayers: preparedPlayers, gameWord: preparedWord);
  }

  List<MapEntry<GamePlayer, List<VotingStat>>> calculateVoting({required List<VotingStat> votingStats}) {
    final groupedVotingStatByVoteWho = groupBy(votingStats, (s) => s.voteWho);
    final groupedVotingStatByVoteWhoKeys = groupedVotingStatByVoteWho.keys.toList()
      ..sort(
        (a, b) => groupedVotingStatByVoteWho[a]!.length.compareTo(groupedVotingStatByVoteWho[b]!.length),
      );

    final orderedGroupedVotingStatByVoteWho = groupedVotingStatByVoteWhoKeys.map((p) => MapEntry(p!, groupedVotingStatByVoteWho[p]!)).toList();
    final mostVotedPlayer = orderedGroupedVotingStatByVoteWho[0];
    final playerWhoHasEqualVotingStats = orderedGroupedVotingStatByVoteWho.where((v) => v.value.length == mostVotedPlayer.value.length).toList();

    return playerWhoHasEqualVotingStats;
  }

  /// voted player in the end in array of probabilities
  List<GamePlayer> computerJustice({required List<GamePlayer> players}) {
    final totalWinRatePool = players.fold<int>(0, (p, e) {
      if (e.mainRole.category == RoleCategory.good) {
        return p + e.player.playerRoleStat.totalWinAsGoodRole;
      } else if (e.mainRole.category == RoleCategory.bad) {
        return p + e.player.playerRoleStat.totalWinAsBadRole;
      } else {
        return p + e.player.playerRoleStat.totalWinAsSoloRole;
      }
    });

    final mappedPlayers = players.map((e) {
      final stat = e.player.playerRoleStat;

      int playerWinRate;

      if (e.mainRole.category == RoleCategory.good) {
        playerWinRate = ((totalWinRatePool / stat.totalWinAsGoodRole) * 100).round();
      } else if (e.mainRole.category == RoleCategory.bad) {
        playerWinRate = ((totalWinRatePool / stat.totalWinAsBadRole) * 100).round();
      } else {
        playerWinRate = ((totalWinRatePool / stat.totalWinAsSoloRole) * 100).round();
      }

      playerWinRate = playerWinRate <= 0 ? 1 : playerWinRate;

      return MapEntry(e, playerWinRate);
    }).toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    final probabilities = <GamePlayer>[];

    for (var i = mappedPlayers.length, j = 0; i > 0; i--, j++) {
      final player = mappedPlayers[j].key;
      final multipleBy = mappedPlayers[i - 1].value;

      probabilities.addAll(List.generate(multipleBy, (_) => player));
    }
    
    probabilities.shuffle();

    final justicedIndex = Random().nextInt(probabilities.length - 1);
    final justicedPlayer = probabilities.removeAt(justicedIndex);

    probabilities.add(justicedPlayer);

    return probabilities;
  }

  //=== PRIVATE ===
  GameWord _prepareWord(Word word) {
    final words = _scrambleWord(word);
    final goodWord = words[0];
    final badWord = words[1];

    return GameWord(word: word, goodWord: goodWord, badWord: badWord);
  }

  List<GamePlayer> _preparePlayers({
    required String goodWord,
    required String badWord,
    required GameSetting setting,
    required List<Player> players,
  }) {
    //ASSIGN MAIN ROLE
    final gamePlayersMainRole = _assignMainRoles(
      goodWord: goodWord,
      badWord: badWord,
      setting: setting,
      mainRoles: setting.mainRolesInGame,
      players: players,
    );

    //ASSIGN PASSIVE ROLE
    final gamePlayers = _assignPassiveRoles(
      passiveRoles: setting.passiveRolesInGame,
      assignedMainRoleGamePlayers: gamePlayersMainRole,
    );

    return gamePlayers;
  }

  List<GamePlayer> _assignMainRoles({
    required String goodWord,
    required String badWord,
    required GameSetting setting,
    required List<MainRole> mainRoles,
    required List<Player> players,
  }) {
    final List<GamePlayer> result = [];
    final String cacheKey = "${runtimeType.toString()};undercover-clueword";

    final shuffledMainRoles = mainRoles.toList()..shuffle();
    for (var i = 0; i < players.length; i++) {
      final player = players[i];
      final role = shuffledMainRoles[i];

      String playerWord = "", clueWord = "";
      if (role.category == RoleCategory.good) {
        playerWord = goodWord; //g-word
      } else if (role.category == RoleCategory.bad) {
        playerWord = badWord; //n-word

        if (setting.undercoverGetWordClue) {
          if (setting.eachUndercoverGetDiffrentClue) {
            clueWord = _hideTheWord(
              word: goodWord,
              percentage: setting.howMuchUndercoverGetClueWords,
              shuffleLetter: setting.randomizeClueWord,
            );
          } else {
            final cachedClueWord = AppCache().get(cacheKey);

            if (cachedClueWord) {
              clueWord = cachedClueWord;
            } else {
              clueWord = _hideTheWord(
                word: goodWord,
                percentage: setting.howMuchUndercoverGetClueWords,
                shuffleLetter: setting.randomizeClueWord,
              );

              AppCache().set(cacheKey, clueWord);
            }
          }
        }
      } else if (role.category == RoleCategory.solo) {
        if (setting.trollOnlyGetOneWord) {
          final shuffledWords = [goodWord, badWord]..shuffle();
          final chosenWord = shuffledWords[0];

          playerWord = _hideTheWord(
            word: chosenWord,
            percentage: setting.howMuchTrollcoverGetClueWords,
            shuffleLetter: setting.randomizeClueWord,
          );
        } else {
          final playersWord = [
            _hideTheWord(
              word: goodWord,
              percentage: setting.howMuchTrollcoverGetClueWords,
              shuffleLetter: setting.randomizeClueWord,
            ),
            _hideTheWord(
              word: badWord,
              percentage: setting.howMuchTrollcoverGetClueWords,
              shuffleLetter: setting.randomizeClueWord,
            )
          ]..shuffle();

          playerWord = playersWord.join(";");
        }
      }

      result.add(GamePlayer(
        player: player,
        mainRole: role,
        word: playerWord,
        clueWord: clueWord,
      ));
    }

    AppCache().remove(cacheKey);

    return result;
  }

  List<GamePlayer> _assignPassiveRoles({required List<PassiveRole> passiveRoles, required List<GamePlayer> assignedMainRoleGamePlayers}) {
    final updatedGamePlayers = assignedMainRoleGamePlayers.toList();

    for (var role in passiveRoles) {
      GamePlayer? player;

      while (player == null) {
        final i = Random().nextInt(updatedGamePlayers.length) - 1;
        final chosenPlayer = updatedGamePlayers[i];

        if (chosenPlayer.passiveRole == null) {
          player = chosenPlayer.copyWith(passiveRole: role);
        }
      }

      updatedGamePlayers[updatedGamePlayers.indexWhere((p) => p.player.id == player!.player.id)] = player;

      //TODO: not done yet
      if (role.name == EnumPassiveRole.justice.toString()) {
      } else if (role.name == EnumPassiveRole.assasin.toString()) {
      } else if (role.name == EnumPassiveRole.couple.toString()) {
      } else if (role.name == EnumPassiveRole.mime.toString()) {}
    }

    return updatedGamePlayers;
  }

  List<String> _scrambleWord(Word word) {
    final result = [word.word1, word.word2];
    result.shuffle();

    return result;
  }

  String _hideTheWord({
    required String word,
    required double percentage,
    required bool shuffleLetter,
  }) {
    int showedLettersCount = (word.length * percentage).floor();
    showedLettersCount = showedLettersCount <= 0 ? 1 : showedLettersCount;

    List<String> letters = word.split("");

    if (shuffleLetter) {
      letters.shuffle();
    }

    letters = letters.getRange(0, showedLettersCount).toList();

    return letters.join();
  }
}
