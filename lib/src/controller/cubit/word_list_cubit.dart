import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'word_list_state.dart';

class WordListCubit extends Cubit<WordListState> {
  WordListCubit() : super(WordListState());
}
