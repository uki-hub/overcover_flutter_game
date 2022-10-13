class AppCache {
  AppCache.__();

  static final AppCache _ = AppCache.__();

  factory AppCache() => _;

  final Map<String, dynamic> _cache = {};

  T? get<T>(String key) {
    final result = _cache[key];

    if (result == null) {
      return null;
    } else {
      return result as T;
    }
  }

  void set(String key, dynamic value) => _cache[key] = value;

  void clear() => _cache.clear();
}
