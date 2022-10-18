import 'dart:convert';

import 'package:overcover/data/models/role/main_role.dart';
import 'package:overcover/data/models/role/passive_role.dart';

class GameSetting {
  final List<MainRole> mainRolesInGame;
  final List<PassiveRole> passiveRolesInGame;

  final bool playerKnowTheirRole;

  final bool justiceIsComputer;

  final bool mrWhiteCanStartFirst;

  final bool showRoleWhenVoted;
  final bool showVotingStats;
  final bool noVotingSection;
  final bool showVotingStatsOnlyForVotedPlayer;

  final bool undercoverGetWordClue;
  final double howMuchUndercoverGetClueWords;
  final bool eachUndercoverGetDiffrentClue;

  final bool trollOnlyGetOneWord;
  final double howMuchTrollcoverGetClueWords;

  final bool randomizeClueWord;

  const GameSetting({
    required this.mainRolesInGame,
    required this.passiveRolesInGame,
    required this.playerKnowTheirRole,
    required this.justiceIsComputer,
    required this.mrWhiteCanStartFirst,
    required this.showRoleWhenVoted,
    required this.showVotingStats,
    required this.noVotingSection,
    required this.showVotingStatsOnlyForVotedPlayer,
    required this.undercoverGetWordClue,
    required this.howMuchUndercoverGetClueWords,
    required this.eachUndercoverGetDiffrentClue,
    required this.trollOnlyGetOneWord,
    required this.howMuchTrollcoverGetClueWords,
    required this.randomizeClueWord,
  });

  static const defaultGameSetting = GameSetting(
    mainRolesInGame: [],
    passiveRolesInGame: [],
    playerKnowTheirRole: false,
    justiceIsComputer: false,
    mrWhiteCanStartFirst: false,
    showRoleWhenVoted: true,
    showVotingStats: true,
    noVotingSection: false,
    showVotingStatsOnlyForVotedPlayer: false,
    undercoverGetWordClue: false,
    howMuchUndercoverGetClueWords: 0,
    eachUndercoverGetDiffrentClue: false,
    trollOnlyGetOneWord: true,
    howMuchTrollcoverGetClueWords: 100,
    randomizeClueWord: false,
  );

  GameSetting copyWith({
    List<MainRole>? mainRolesInGame,
    List<PassiveRole>? passiveRolesInGame,
    bool? playerKnowTheirRole,
    bool? justiceIsComputer,
    bool? mrWhiteCanStartFirst,
    bool? showRoleWhenVoted,
    bool? showVotingStats,
    bool? noVotingSection,
    bool? showVotingStatsOnlyForVotedPlayer,
    bool? undercoverGetWordClue,
    double? howMuchUndercoverGetClueWords,
    bool? eachUndercoverGetDiffrentClue,
    bool? trollOnlyGetOneWord,
    double? howMuchTrollcoverGetClueWords,
    bool? randomizeClueWord,
  }) {
    return GameSetting(
      mainRolesInGame: mainRolesInGame ?? this.mainRolesInGame,
      passiveRolesInGame: passiveRolesInGame ?? this.passiveRolesInGame,
      playerKnowTheirRole: playerKnowTheirRole ?? this.playerKnowTheirRole,
      justiceIsComputer: justiceIsComputer ?? this.justiceIsComputer,
      mrWhiteCanStartFirst: mrWhiteCanStartFirst ?? this.mrWhiteCanStartFirst,
      showRoleWhenVoted: showRoleWhenVoted ?? this.showRoleWhenVoted,
      showVotingStats: showVotingStats ?? this.showVotingStats,
      noVotingSection: noVotingSection ?? this.noVotingSection,
      showVotingStatsOnlyForVotedPlayer: showVotingStatsOnlyForVotedPlayer ?? this.showVotingStatsOnlyForVotedPlayer,
      undercoverGetWordClue: undercoverGetWordClue ?? this.undercoverGetWordClue,
      howMuchUndercoverGetClueWords: howMuchUndercoverGetClueWords ?? this.howMuchUndercoverGetClueWords,
      eachUndercoverGetDiffrentClue: eachUndercoverGetDiffrentClue ?? this.eachUndercoverGetDiffrentClue,
      trollOnlyGetOneWord: trollOnlyGetOneWord ?? this.trollOnlyGetOneWord,
      howMuchTrollcoverGetClueWords: howMuchTrollcoverGetClueWords ?? this.howMuchTrollcoverGetClueWords,
      randomizeClueWord: randomizeClueWord ?? this.randomizeClueWord,
    );
  }
}
