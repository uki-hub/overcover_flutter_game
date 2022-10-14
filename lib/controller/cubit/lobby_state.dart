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

  Map<String, dynamic> toMap() {
    return {
      'players': players.map((x) => x.toMap()).toList(),
      'selectedMainRoles': selectedMainRoles,
      'selectedPassiveRoles': selectedPassiveRoles,
      'gameSetting': gameSetting.toMap(),
    };
  }

  factory LobbyState.fromMap(Map<String, dynamic> map) {
    return LobbyState(
      players: List<Player>.from(map['players']?.map((x) => Player.fromMap(x))),
      selectedMainRoles: Map<MainRole, int>.from(map['selectedMainRoles']),
      selectedPassiveRoles: Map<PassiveRole, int>.from(map['selectedPassiveRoles']),
      gameSetting: GameSetting.fromMap(map['gameSetting']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LobbyState.fromJson(String source) => LobbyState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LobbyState(players: $players, selectedMainRoles: $selectedMainRoles, selectedPassiveRoles: $selectedPassiveRoles, gameSetting: $gameSetting)';
  }
}
