import 'dart:convert';

class PlayerRoleStat {
  final int totalWinAsGoodRole;
  final int totalWinAsBadRole;
  final int totalWinAsSoloRole;
  final int totalWinAsCivillian;
  final int totalWinAsUndercover;
  final int totalWinAsTroll;
  final int totalWinAsCouple;
  final int totalWinAsJustice;
  final int totalWinAsMime;

  const PlayerRoleStat({
    required this.totalWinAsGoodRole,
    required this.totalWinAsBadRole,
    required this.totalWinAsSoloRole,
    required this.totalWinAsCivillian,
    required this.totalWinAsUndercover,
    required this.totalWinAsTroll,
    required this.totalWinAsCouple,
    required this.totalWinAsJustice,
    required this.totalWinAsMime,
  });

  PlayerRoleStat copyWith({
    int? totalWinAsGoodRole,
    int? totalWinAsBadRole,
    int? totalWinAsSoloRole,
    int? totalWinAsCivillian,
    int? totalWinAsUndercover,
    int? totalWinAsTroll,
    int? totalWinAsCouple,
    int? totalWinAsJustice,
    int? totalWinAsMime,
  }) {
    return PlayerRoleStat(
      totalWinAsGoodRole: totalWinAsGoodRole ?? this.totalWinAsGoodRole,
      totalWinAsBadRole: totalWinAsBadRole ?? this.totalWinAsBadRole,
      totalWinAsSoloRole: totalWinAsSoloRole ?? this.totalWinAsSoloRole,
      totalWinAsCivillian: totalWinAsCivillian ?? this.totalWinAsCivillian,
      totalWinAsUndercover: totalWinAsUndercover ?? this.totalWinAsUndercover,
      totalWinAsTroll: totalWinAsTroll ?? this.totalWinAsTroll,
      totalWinAsCouple: totalWinAsCouple ?? this.totalWinAsCouple,
      totalWinAsJustice: totalWinAsJustice ?? this.totalWinAsJustice,
      totalWinAsMime: totalWinAsMime ?? this.totalWinAsMime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalWinAsGoodRole': totalWinAsGoodRole,
      'totalWinAsBadRole': totalWinAsBadRole,
      'totalWinAsSoloRole': totalWinAsSoloRole,
      'totalWinAsCivillian': totalWinAsCivillian,
      'totalWinAsUndercover': totalWinAsUndercover,
      'totalWinAsTroll': totalWinAsTroll,
      'totalWinAsCouple': totalWinAsCouple,
      'totalWinAsJustice': totalWinAsJustice,
      'totalWinAsMime': totalWinAsMime,
    };
  }

  factory PlayerRoleStat.fromMap(Map<String, dynamic> map) {
    return PlayerRoleStat(
      totalWinAsGoodRole: map['totalWinAsGoodRole']?.toInt() ?? 0,
      totalWinAsBadRole: map['totalWinAsBadRole']?.toInt() ?? 0,
      totalWinAsSoloRole: map['totalWinAsSoloRole']?.toInt() ?? 0,
      totalWinAsCivillian: map['totalWinAsCivillian']?.toInt() ?? 0,
      totalWinAsUndercover: map['totalWinAsUndercover']?.toInt() ?? 0,
      totalWinAsTroll: map['totalWinAsTroll']?.toInt() ?? 0,
      totalWinAsCouple: map['totalWinAsCouple']?.toInt() ?? 0,
      totalWinAsJustice: map['totalWinAsJustice']?.toInt() ?? 0,
      totalWinAsMime: map['totalWinAsMime']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayerRoleStat.fromJson(String source) => PlayerRoleStat.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PlayerRoleState(totalWinAsGoodRole: $totalWinAsGoodRole, totalWinAsBadRole: $totalWinAsBadRole, totalWinAsSoloRole: $totalWinAsSoloRole, totalWinAsCivillian: $totalWinAsCivillian, totalWinAsUndercover: $totalWinAsUndercover, totalWinAsTroll: $totalWinAsTroll, totalWinAsCouple: $totalWinAsCouple, totalWinAsJustice: $totalWinAsJustice, totalWinAsMime: $totalWinAsMime)';
  }
}
