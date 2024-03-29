import 'package:overcover/enums/role_enums.dart';

abstract class BaseRole {
  final String name;
  final String description;
  final int winPoint;
  final int losePoint;

  const BaseRole({
    required this.name,
    required this.description,
    required this.winPoint,
    required this.losePoint,
  });
}
