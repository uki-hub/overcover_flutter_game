part of 'play_cubit.dart';

abstract class PlayState {
  final LobbySetting lobbySetting;
  final List<Player> alivePlayers;
}
// class PlayState {
//   final PlayScreen screen;
//   final List<Player> alivePlayers;
//   final List<Player> deadPlayers;
//   final LobbySetting lobbySetting;
// }

class PlayerGetWordAndRole extends PlayState {
  
}

class Voting extends PlayState {

}

class PickPlayerToBeVoted extends PlayState {

}

class VotingResult extends PlayState {

}

class GameResult extends PlayState {
  
}

class JusticeVote extends PlayState {

}

class AssassinPickPlayer extends PlayState {

}