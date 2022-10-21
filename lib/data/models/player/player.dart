import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:overcover/data/models/player/player_role_stat.dart';

class Player extends Equatable {
  final int id;
  final String name;
  final int totalGames;
  final int points;
  final DateTime playingSince;
  final PlayerRoleStat playerRoleStat;

  const Player({
    required this.id,
    required this.name,
    required this.totalGames,
    required this.points,
    required this.playingSince,
    required this.playerRoleStat,
  });

  Player copyWith({
    String? name,
    int? totalGames,
    int? points,
    DateTime? playingSince,
    PlayerRoleStat? playerRoleStat,
  }) {
    return Player(
      id: id,
      name: name ?? this.name,
      totalGames: totalGames ?? this.totalGames,
      points: points ?? this.points,
      playingSince: playingSince ?? this.playingSince,
      playerRoleStat: playerRoleStat ?? this.playerRoleStat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'totalGames': totalGames,
      'points': points,
      'playingSince': playingSince.millisecondsSinceEpoch,
      'playerRoleState': playerRoleStat.toMap(),
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      totalGames: map['totalGames']?.toInt() ?? 0,
      points: map['points']?.toInt() ?? 0,
      playingSince: DateTime.fromMillisecondsSinceEpoch(map['playingSince']),
      playerRoleStat: PlayerRoleStat.fromMap(map['playerRoleState']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Player.fromJson(String source) => Player.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Player(id: $id, name: $name, totalGames: $totalGames, points: $points, playingSince: $playingSince, playerRoleState: $playerRoleStat)';
  }

  @override
  List<Object> get props {
    return [id, name];
  }
}
