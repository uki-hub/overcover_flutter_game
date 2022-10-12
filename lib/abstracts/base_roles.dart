abstract class BaseRoles<T> {
  
  const BaseRoles();

  Map<String, T> get mapRoles;
  T getRoleByString(String roleName) => mapRoles[roleName]!;
}