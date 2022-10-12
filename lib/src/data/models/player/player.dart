
import 'package:overcover/src/data/models/player/player_role_state.dart';

class Player {
  final int id;
  final String name;
  final int totalGames;
  final int points;
  final DateTime playingSince;
  final PlayerRoleState playerRoleState;
  
  const Player({
    required this.id,
    required this.name,
    required this.totalGames,
    required this.points,
    required this.playingSince,
    required this.playerRoleState,
  });

  
}
