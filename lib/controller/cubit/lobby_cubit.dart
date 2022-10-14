import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:overcover/data/models/lobby/game_setting.dart';
import 'package:overcover/data/models/player/player.dart';
import 'package:overcover/data/models/role/main_role.dart';
import 'package:overcover/data/models/role/passive_role.dart';

part 'lobby_state.dart';

class LobbyCubit extends Cubit<LobbyState> {
  LobbyCubit()
      : super(const LobbyState(
          players: [],
          selectedMainRoles: {},
          selectedPassiveRoles: {},
          gameSetting: GameSetting.defaultGameSetting,
        ));

  void setPlayers(List<Player> newPlayers) => emit(state.copyWith(players: newPlayers));

  void setMainRoles(Map<MainRole, int> newMainRoles) => emit(state.copyWith(selectedMainRoles: newMainRoles));
  
  void setPassiveRoles(Map<PassiveRole, int> newPassiveRoles) => emit(state.copyWith(selectedPassiveRoles: newPassiveRoles));

  void setGameSettings(GameSettingg setting) => emit(state.copyWith(gameSetting: setting));
}
