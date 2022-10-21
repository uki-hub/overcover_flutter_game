part of 'lobby_cubit.dart';

class LobbyState {
  final List<Player> players;
  final Map<MainRole, int> selectedMainRoles;
  final Map<PassiveRole, int> selectedPassiveRoles;
  final GameSetting gameSetting;
  
  const LobbyState({
    required this.players,
    required this.selectedMainRoles,
    required this.selectedPassiveRoles,
    required this.gameSetting,
  });

  LobbyState copyWith({
    List<Player>? players,
    Map<MainRole, int>? selectedMainRoles,
    Map<PassiveRole, int>? selectedPassiveRoles,
    GameSetting? gameSetting,
  }) {
    return LobbyState(
      players: players ?? this.players,
      selectedMainRoles: selectedMainRoles ?? this.selectedMainRoles,
      selectedPassiveRoles: selectedPassiveRoles ?? this.selectedPassiveRoles,
      gameSetting: gameSetting ?? this.gameSetting,
    );
  }
  @override
  String toString() {
    return 'LobbyState(players: $players, selectedMainRoles: $selectedMainRoles, selectedPassiveRoles: $selectedPassiveRoles, gameSetting: $gameSetting)';
  }
}
