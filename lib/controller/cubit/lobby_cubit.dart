import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:overcover/abstracts/base_role.dart';
import 'package:overcover/data/models/lobby/game_setting.dart';
import 'package:overcover/data/models/player/player.dart';
import 'package:overcover/data/models/role/main_role.dart';
import 'package:overcover/data/models/role/main_roles.dart';
import 'package:overcover/data/models/role/passive_role.dart';
import 'package:overcover/data/models/role/passive_roles.dart';

part 'lobby_state.dart';

class LobbyCubit extends Cubit<LobbyState> {
  LobbyCubit() : super(LobbyState());

  void setGameSettings(LobbySetting setting) {

  }
}
