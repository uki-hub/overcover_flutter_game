import 'package:equatable/equatable.dart';

class PlayerRoleState {
  final int totalWinAsGoodRole;
  final int totalWinAsBadRole;
  final int totalWinAsSoloRole;
  final int totalWinAsCivillian;
  final int totalWinAsUndercover;
  final int totalWinAsTroll;
  final int totalWinAsCouple;
  final int totalWinAsJustice;
  final int totalWinAsMime;

  const PlayerRoleState({
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
}
