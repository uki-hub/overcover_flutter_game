part of 'play_cubit.dart';

abstract class PlayState {
  final List<GamePlayer> alivePlayers;
  final List<GamePlayer> deathPlayers;

  final GameSetting gameSetting;

  const PlayState({
    required this.alivePlayers,
    required this.deathPlayers,
    required this.gameSetting,
  });

  GamePlayer get getJustice {
    final key = '${runtimeType.toString()};justice';
    GamePlayer? justice = AppCache().get<GamePlayer?>(key);

    if (justice == null) {
      final players = alivePlayers.toList();

      if (gameSetting.justiceCanVoteAfterBeingVoted) {
        players.addAll(deathPlayers);
      }

      justice = players.firstWhere((e) => e.passiveRole?.name == EnumPassiveRole.justice.toString());

      AppCache().set(key, justice);
    }

    return justice;
  }
}

//PREPARE
class PrepareGame extends PlayState {
  final List<Player> players;

  const PrepareGame({
    required this.players,
    required super.alivePlayers,
    required super.deathPlayers,
    required super.gameSetting,
  });
}

class PlayerGetWordAndRole extends PlayState {
  final int playerIndex;
  final bool isSeen;

  const PlayerGetWordAndRole({
    required this.playerIndex,
    required this.isSeen,
    required super.alivePlayers,
    required super.deathPlayers,
    required super.gameSetting,
  });

  PlayerGetWordAndRole copyWith({
    int? playerIndex,
    bool? isSeen,
  }) {
    return PlayerGetWordAndRole(
      playerIndex: playerIndex ?? this.playerIndex,
      isSeen: isSeen ?? this.isSeen,
      alivePlayers: alivePlayers,
      deathPlayers: deathPlayers,
      gameSetting: gameSetting,
    );
  }
}

//PLAYING
class PlayerSayTheirWordClue extends PlayState {
  const PlayerSayTheirWordClue({
    required super.alivePlayers,
    required super.deathPlayers,
    required super.gameSetting,
  });
}

//VOTING
class Voting extends PlayState {
  final List<VotingStat> votingStats;

  const Voting({
    required this.votingStats,
    required super.alivePlayers,
    required super.deathPlayers,
    required super.gameSetting,
  });
}

class PlayerToVoting extends Voting {
  final int playerIndex;

  const PlayerToVoting({
    required this.playerIndex,
    required super.votingStats,
    required super.alivePlayers,
    required super.deathPlayers,
    required super.gameSetting,
  });

  PlayerToVoting copyWith({
    int? playerIndex,
    List<VotingStat>? votingStats,
  }) {
    return PlayerToVoting(
      playerIndex: playerIndex ?? this.playerIndex,
      votingStats: votingStats ?? this.votingStats,
      alivePlayers: alivePlayers,
      deathPlayers: deathPlayers,
      gameSetting: gameSetting,
    );
  }
}

class JusticeVotePlayer extends Voting {
  final GamePlayer justice;

  const JusticeVotePlayer({
    required this.justice,
    required super.votingStats,
    required super.alivePlayers,
    required super.deathPlayers,
    required super.gameSetting,
  });
}

class ComputerJusticeVotePlayer extends Voting {
  final List<GamePlayer> justicedPlayers;

  GamePlayer get justicedPlayer => justicedPlayers.last;

  const ComputerJusticeVotePlayer({
    required this.justicedPlayers,
    required super.votingStats,
    required super.alivePlayers,
    required super.deathPlayers,
    required super.gameSetting,
  });
}

class PickPlayerToBeVoted extends Voting {
  const PickPlayerToBeVoted({
    required super.votingStats,
    required super.alivePlayers,
    required super.deathPlayers,
    required super.gameSetting,
  });
}

class VotingResult extends Voting {
  final GamePlayer votedPlayer;

  const VotingResult({
    required this.votedPlayer,
    required super.votingStats,
    required super.alivePlayers,
    required super.deathPlayers,
    required super.gameSetting,
  });
}

class GameResult extends PlayState {}

class JusticeVote extends PlayState {}

class AssassinPickPlayer extends PlayState {}
