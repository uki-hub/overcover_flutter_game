abstract class BaseRoles<T, E> {
  BaseRoles() {
    if(mappedRoles == null) throw UnimplementedError('mappedRoles is not implemented in ${runtimeType.toString()}');
  }

  Map<E, T>? get mappedRoles;
}
