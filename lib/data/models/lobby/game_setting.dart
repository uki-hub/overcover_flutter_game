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
    required this.showRoleWhenVoted,
    required this.showVotingStats,
    required this.playerKnowTheirRole,
    required this.justiceIsComputer,
    required this.mrWhiteCanStartFirst,
    required this.noVotingSection,
  });
}
