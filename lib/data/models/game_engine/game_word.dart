import 'package:overcover/data/models/word.dart';

class GameWord {
  final Word word;
  final String goodWord;
  final String badWord;
  
  const GameWord({
    required this.word,
    required this.goodWord,
    required this.badWord,
  });
}
