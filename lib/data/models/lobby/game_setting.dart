import 'dart:convert';

class GameSetting {
  final bool playerKnowTheirRole;

  final bool justiceIsComputer;

  final bool mrWhiteCanStartFirst;

  final bool showRoleWhenVoted;
  final bool showVotingStats;
  final bool noVotingSection;

  final bool undercoverGetWordClue;
  final double howMuchUndercoverGetClueWords;

  final bool trollOnlyGetOneWord;
  final double howMuchTrollcoverGetClueWords;

  const GameSetting({
    required this.playerKnowTheirRole,
    required this.justiceIsComputer,
    required this.mrWhiteCanStartFirst,
    required this.showRoleWhenVoted,
    required this.showVotingStats,
    required this.noVotingSection,
    required this.undercoverGetWordClue,
    required this.howMuchUndercoverGetClueWords,
    required this.trollOnlyGetOneWord,
    required this.howMuchTrollcoverGetClueWords,
  });

  static const defaultGameSetting = GameSetting(
    playerKnowTheirRole: false,
    justiceIsComputer: false,
    mrWhiteCanStartFirst: false,
    showRoleWhenVoted: true,
    showVotingStats: true,
    noVotingSection: false,
    undercoverGetWordClue: false,
    howMuchUndercoverGetClueWords: 0,
    trollOnlyGetOneWord: true,
    howMuchTrollcoverGetClueWords: 100,
  );

  GameSetting copyWith({
    bool? playerKnowTheirRole,
    bool? justiceIsComputer,
    bool? mrWhiteCanStartFirst,
    bool? showRoleWhenVoted,
    bool? showVotingStats,
    bool? noVotingSection,
    bool? undercoverGetWordClue,
    double? howMuchUndercoverGetClueWords,
    bool? trollOnlyGetOneWord,
    double? howMuchTrollcoverGetClueWords,
  }) {
    return GameSetting(
      playerKnowTheirRole: playerKnowTheirRole ?? this.playerKnowTheirRole,
      justiceIsComputer: justiceIsComputer ?? this.justiceIsComputer,
      mrWhiteCanStartFirst: mrWhiteCanStartFirst ?? this.mrWhiteCanStartFirst,
      showRoleWhenVoted: showRoleWhenVoted ?? this.showRoleWhenVoted,
      showVotingStats: showVotingStats ?? this.showVotingStats,
      noVotingSection: noVotingSection ?? this.noVotingSection,
      undercoverGetWordClue: undercoverGetWordClue ?? this.undercoverGetWordClue,
      howMuchUndercoverGetClueWords: howMuchUndercoverGetClueWords ?? this.howMuchUndercoverGetClueWords,
      trollOnlyGetOneWord: trollOnlyGetOneWord ?? this.trollOnlyGetOneWord,
      howMuchTrollcoverGetClueWords: howMuchTrollcoverGetClueWords ?? this.howMuchTrollcoverGetClueWords,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'playerKnowTheirRole': playerKnowTheirRole,
      'justiceIsComputer': justiceIsComputer,
      'mrWhiteCanStartFirst': mrWhiteCanStartFirst,
      'showRoleWhenVoted': showRoleWhenVoted,
      'showVotingStats': showVotingStats,
      'noVotingSection': noVotingSection,
      'undercoverGetWordClue': undercoverGetWordClue,
      'howMuchUndercoverGetClueWords': howMuchUndercoverGetClueWords,
      'trollOnlyGetOneWord': trollOnlyGetOneWord,
      'howMuchTrollcoverGetClueWords': howMuchTrollcoverGetClueWords,
    };
  }

  factory GameSetting.fromMap(Map<String, dynamic> map) {
    return GameSetting(
      playerKnowTheirRole: map['playerKnowTheirRole'] ?? false,
      justiceIsComputer: map['justiceIsComputer'] ?? false,
      mrWhiteCanStartFirst: map['mrWhiteCanStartFirst'] ?? false,
      showRoleWhenVoted: map['showRoleWhenVoted'] ?? false,
      showVotingStats: map['showVotingStats'] ?? false,
      noVotingSection: map['noVotingSection'] ?? false,
      undercoverGetWordClue: map['undercoverGetWordClue'] ?? false,
      howMuchUndercoverGetClueWords: map['howMuchUndercoverGetClueWords']?.toDouble() ?? 0.0,
      trollOnlyGetOneWord: map['trollOnlyGetOneWord'] ?? false,
      howMuchTrollcoverGetClueWords: map['howMuchTrollcoverGetClueWords']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory GameSetting.fromJson(String source) => GameSetting.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GameSetting(playerKnowTheirRole: $playerKnowTheirRole, justiceIsComputer: $justiceIsComputer, mrWhiteCanStartFirst: $mrWhiteCanStartFirst, showRoleWhenVoted: $showRoleWhenVoted, showVotingStats: $showVotingStats, noVotingSection: $noVotingSection, undercoverGetWordClue: $undercoverGetWordClue, howMuchUndercoverGetClueWords: $howMuchUndercoverGetClueWords, trollOnlyGetOneWord: $trollOnlyGetOneWord, howMuchTrollcoverGetClueWords: $howMuchTrollcoverGetClueWords)';
  }
}
