import 'dart:convert';

class Word {
  final int no;
  final String word1;
  final String word2;
  final bool isUsed;

  const Word({
    required this.no,
    required this.word1,
    required this.word2,
    required this.isUsed,
  });

  Word copyWith({
    bool? isUsed,
  }) {
    return Word(
      no: no,
      word1: word1,
      word2: word2,
      isUsed: isUsed ?? this.isUsed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'no': no,
      'word1': word1,
      'word2': word2,
      'isUsed': isUsed,
    };
  }

  factory Word.fromMap(Map<String, dynamic> map) {
    return Word(
      no: map['no']?.toInt() ?? 0,
      word1: map['word1'] ?? '',
      word2: map['word2'] ?? '',
      isUsed: map['isUsed'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Word.fromJson(String source) => Word.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Word(no: $no, word1: $word1, word2: $word2, isUsed: $isUsed)';
  }
}
