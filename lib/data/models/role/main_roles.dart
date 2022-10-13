import 'package:overcover/abstracts/base_roles.dart';
import 'package:overcover/enums/role_enums.dart';
import 'package:overcover/data/models/role/main_role.dart';

class MainRoles extends BaseRoles<MainRole> {
  static final _mapRoles = {
    'civillian': MainRole(
      name: 'Civillian',
      description: '',
      winPoint: 10,
      losePoint: 20,
      category: RoleCategory.good,
      whenVoted: () => {},
    ),
    'undercover': MainRole(
      name: 'Undercover',
      description: '',
      winPoint: 20,
      losePoint: 10,
      category: RoleCategory.bad,
      whenVoted: () => {},
    ),
    'troll': MainRole(
      name: 'Troll',
      description: '',
      winPoint: 30,
      losePoint: 20,
      category: RoleCategory.solo,
      whenVoted: () => {},
    ),
    'mrwhite': MainRole(
      name: 'Mr. White',
      description: '',
      winPoint: 50,
      losePoint: 10,
      category: RoleCategory.solo,
      whenVoted: () => {},
    ),
  };

  MainRoles() : super();

  @override
  Map<String, MainRole> get mapRoles => _mapRoles;
}
