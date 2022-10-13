import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:overcover/enums/play_enums.dart';
import 'package:overcover/data/models/lobby/game_setting.dart';
import 'package:overcover/data/models/player/player.dart';

part 'play_state.dart';

class PlayCubit extends Cubit<PlayState> {
  PlayCubit() : super(PlayState());
}
