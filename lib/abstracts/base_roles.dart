import 'package:overcover/app/cache.dart';

abstract class BaseRoles<T> {
  String get _listCacheKey => "${runtimeType.toString()};toList";

  const BaseRoles();

  Map<String, T> get mapRoles;

  T getRoleByString(String roleName) => mapRoles[roleName]!;

  List<T> toList() {
    final cachedList = AppCache().get<List<T>>(_listCacheKey);

    if (cachedList == null) {
      final result = <T>[];

      for (var roleName in mapRoles.keys) {
        final role = mapRoles[roleName];
        if (role != null) {
          result.add(role);
        }
      }

      AppCache().set(_listCacheKey, result);

      return result;
    } else {
      return cachedList;
    }
  }
}
