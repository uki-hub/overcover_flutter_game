import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:overcover/enums/play_enums.dart';
import 'package:overcover/src/data/models/lobby/lobby_setting.dart';
import 'package:overcover/src/data/models/player/player.dart';

part 'play_state.dart';

class PlayCubit extends Cubit<PlayState> {
  PlayCubit() : super(PlayState());
}
