import 'package:overcover/abstracts/base_roles.dart';
import 'package:overcover/data/models/role/passive_role.dart';

enum EnumPassiveRole {
  justice,
  mime,
  couple,
  assasin,
}

class PassiveRoles extends BaseRoles<PassiveRole> {
  static final _mapRoles = {
    'justice': PassiveRole(
      name: 'Justice',
      description: '',
      winPoint: 10,
      losePoint: 20,
      whenVoted: () => {},
    ),
    'mime': PassiveRole(
      name: 'Mime',
      description: '',
      winPoint: 10,
      losePoint: 0,
      whenVoted: () => {},
    ),
    'couple': PassiveRole(
      name: 'Couple',
      description: '',
      winPoint: 30,
      losePoint: 20,
      whenVoted: () => {},
    ),
    'assassin': PassiveRole(
      name: 'Assassin',
      description: '',
      winPoint: 10,
      losePoint: 20,
      whenVoted: () => {},
    ),
  };

  @override
  Map<String, PassiveRole> get mapRoles => _mapRoles;
}
