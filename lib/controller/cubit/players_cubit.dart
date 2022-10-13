import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:overcover/data/models/player/player.dart';
import 'package:overcover/data/models/role/main_role.dart';
import 'package:overcover/data/models/role/passive_role.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit() : super(PlayersState([]));

  void playerWin(MainRole mainRole, {PassiveRole? passiveRole}) {
    
  }
  
  void playerLose(MainRole mainRole, {PassiveRole? passiveRole}) {

  }

  void addPlayer(String name) {
    
  }
}
