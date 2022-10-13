import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:overcover/data/models/word.dart';

part 'word_list_state.dart';

class WordListCubit extends Cubit<WordListState> {
  WordListCubit() : super(const WordListState([]));

  Word getWord() {
    final unpickedWords = state.worldList.where((w) => !w.isUsed).toList()..shuffle();

    final pickedIndexWord = Random().nextInt(unpickedWords.length - 1);
    final pickedWord = unpickedWords[pickedIndexWord];

    useWord(pickedWord);

    return pickedWord;
  }

  void useWord(Word word) {
    final updatedWord = word.copyWith(isUsed: true);
    final updatedWords = state.worldList.toList();

    updatedWords[updatedWords.indexWhere((w) => w.no == updatedWord.no)] = updatedWord;

    emit(WordListState(updatedWords));
  }

  void addWord(String word1, String word2) {
    final updatedWords = state.worldList.toList();
    updatedWords.sort(((a, b) => a.no.compareTo(b.no)));

    final newWordIndex = updatedWords.last.no + 1;

    updatedWords.add(Word(
      no: newWordIndex,
      word1: word1,
      word2: word2,
      isUsed: false,
    ));

    emit(WordListState(updatedWords));
  }

  void deleteWord(int no) {
    final updatedWords = state.worldList.toList();

    updatedWords.removeWhere((w) => w.no == no);

    emit(WordListState(updatedWords));
  }

  void resetWords() {
    final updatedWords = state.worldList.map((w) => w.copyWith(isUsed: false)).toList();

    emit(WordListState(updatedWords));
  }
}
