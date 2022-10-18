import 'package:overcover/data/models/game_engine/game_word.dart';
import 'package:overcover/data/models/play/game_player.dart';

class GameModel {
  final List<GamePlayer> gamePlayers;
  final GameWord gameWord;

  const GameModel({
    required this.gamePlayers,
    required this.gameWord,
  });
}
