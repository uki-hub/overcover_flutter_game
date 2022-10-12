import 'package:flutter/material.dart';
import 'package:overcover/abstracts/base_role.dart';

class PassiveRole extends BaseRole {

  const PassiveRole({
    required String name,
    required String description,
    required int winPoint,
    required int losePoint,
    required VoidCallback whenVoted,
  }) : super(
          name: name,
          description: description,
          winPoint: winPoint,
          losePoint: losePoint,
          whenVoted: whenVoted,
        );
}
