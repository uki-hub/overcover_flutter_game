import 'package:overcover/abstracts/base_roles.dart';
import 'package:overcover/data/models/role/passive_role.dart';

enum EnumPassiveRole {
  justice,
  mime,
  couple,
  assasin,
}

class PassiveRoles extends BaseRoles<PassiveRole, EnumPassiveRole> {
  PassiveRoles.__();

  static final PassiveRoles _ = PassiveRoles.__();

  factory PassiveRoles() => _;

  static const justice = PassiveRole(
    name: 'Justice',
    description: '',
    winPoint: 10,
    losePoint: 20,
  );

  static const mime = PassiveRole(
    name: 'Mime',
    description: '',
    winPoint: 10,
    losePoint: 0,
  );

  static const couple = PassiveRole(
    name: 'Couple',
    description: '',
    winPoint: 30,
    losePoint: 20,
  );

  static const assassin = PassiveRole(
    name: 'Assassin',
    description: '',
    winPoint: 10,
    losePoint: 20,
  );
  
  @override
  Map<EnumPassiveRole, PassiveRole>? get mappedRoles => {
    EnumPassiveRole.justice: justice,
    EnumPassiveRole.mime: mime,
    EnumPassiveRole.couple: couple,
    EnumPassiveRole.assasin: assassin,
  };
}
