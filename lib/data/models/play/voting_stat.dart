import 'package:overcover/data/models/play/game_player.dart';

class VotingStat {
  final GamePlayer player;
  final GamePlayer? voteWho;

  const VotingStat({required this.player, this.voteWho});
}
