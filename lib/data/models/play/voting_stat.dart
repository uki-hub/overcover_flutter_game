import 'package:overcover/data/models/play/game_player.dart';

class VotingStat {
  final GamePlayer votedPlayer;
  final List<GamePlayer> votedBys;

  const VotingStat({required this.votedPlayer, required this.votedBys});
}
