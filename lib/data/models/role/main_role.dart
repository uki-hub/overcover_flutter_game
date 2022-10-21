import 'package:flutter/cupertino.dart';
import 'package:overcover/abstracts/base_role.dart';
import 'package:overcover/enums/role_enums.dart';

class MainRole extends BaseRole {
  final RoleCategory category;

  const MainRole({
    required String name,
    required String description,
    required int winPoint,
    required int losePoint,
    required this.category,
  }) : super(
          name: name,
          description: description,
          winPoint: winPoint,
          losePoint: losePoint,
        );
}
