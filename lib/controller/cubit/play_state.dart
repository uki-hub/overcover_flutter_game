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

class PickPlayerToBeVoted extends PlayState {}

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
