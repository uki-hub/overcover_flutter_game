import 'package:overcover/abstracts/base_roles.dart';
import 'package:overcover/enums/role_enums.dart';
import 'package:overcover/data/models/role/main_role.dart';

enum EnumMainRule {
  civillian,
  undercover,
  troll,
  mrwhite,
}

class MainRoles extends BaseRoles<MainRole, EnumMainRule> {
  MainRoles.__();

  static final MainRoles _ = MainRoles.__();

  factory MainRoles() => _;

  static const civillian = MainRole(
    name: 'Civillian',
    description: '',
    winPoint: 10,
    losePoint: 20,
    category: RoleCategory.good,
  );

  static const undercover = MainRole(
    name: 'Undercover',
    description: '',
    winPoint: 20,
    losePoint: 10,
    category: RoleCategory.bad,
  );

  static const troll = MainRole(
    name: 'Troll',
    description: '',
    winPoint: 30,
    losePoint: 20,
    category: RoleCategory.solo,
  );

  static const mrwhite = MainRole(
    name: 'Mr. White',
    description: '',
    winPoint: 50,
    losePoint: 10,
    category: RoleCategory.solo,
  );

  @override
  Map<EnumMainRule, MainRole>? get mappedRoles => {
        EnumMainRule.civillian: civillian,
        EnumMainRule.undercover: undercover,
        EnumMainRule.troll: troll,
        EnumMainRule.mrwhite: mrwhite,
      };
}
