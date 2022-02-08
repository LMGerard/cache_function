final Map<int, Map<int, dynamic>> _cache = {};
final Map<int, Map<int, dynamic>> _cache2 = {};
final Map<int, Map<int, dynamic>> _cache3 = {};
final Map<int, Map<int, dynamic>> _cacheN = {};

extension CacheFunction<T, K> on T Function(K) {
  void initCache() => _cache[hashCode] = <int, T>{};

  T callCached(K arg) =>
      _cache[hashCode]!.putIfAbsent(arg.hashCode, () => this(arg)) as T;

  static Map<int, Map<dynamic, dynamic>> get cache => _cache;
}

extension CacheFunction2<T, K, L> on T Function(K, L) {
  void initCache() => _cache2[hashCode] = <int, T>{};

  T callCached(K arg1, L arg2) => _cache2[hashCode]!
      .putIfAbsent(Object.hash(arg1, arg2), () => this(arg1, arg2)) as T;

  static Map<int, Map<dynamic, dynamic>> get cache => _cache2;
}

extension CacheFunction3<T, K, L, M> on T Function(K, L, M) {
  void initCache() => _cache3[hashCode] = <int, T>{};

  T callCached(K arg1, L arg2, M arg3) => _cache3[hashCode]!.putIfAbsent(
      Object.hash(arg1, arg2, arg3), () => this(arg1, arg2, arg3)) as T;

  static Map<int, Map<dynamic, dynamic>> get cache => _cache3;
}

extension CacheFunctionN<T> on T Function(Iterable) {
  void initCache() => _cacheN[hashCode] = <int, T>{};

  T callCached(args) =>
      _cacheN[hashCode]!.putIfAbsent(Object.hashAll(args), () => this(args))
          as T;

  static Map<int, Map<dynamic, dynamic>> get cache => _cacheN;
}
