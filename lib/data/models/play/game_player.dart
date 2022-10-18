import 'package:equatable/equatable.dart';

import 'package:overcover/data/models/player/player.dart';
import 'package:overcover/data/models/role/main_role.dart';
import 'package:overcover/data/models/role/passive_role.dart';

class GamePlayer extends Equatable {
  final Player player;
  final MainRole mainRole;
  final PassiveRole? passiveRole;
  final String word;
  final String clueWord;

  const GamePlayer({
    required this.player,
    required this.mainRole,
    required this.word,
    required this.clueWord,
    this.passiveRole,
  });

  GamePlayer copyWith({
    PassiveRole? passiveRole,
    String? clueWord,
  }) {
    return GamePlayer(
      player: player,
      mainRole: mainRole,
      passiveRole: passiveRole ?? this.passiveRole,
      word: word,
      clueWord: clueWord ?? this.clueWord,
    );
  }

  @override
  List<Object> get props {
    return [player];
  }
}
