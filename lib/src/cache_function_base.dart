final Map<int, Map<Comparable, dynamic>> _cache = {};

extension CacheFunctionInt<T, K> on T Function(K) {
  void initCache() => _cache[hashCode] = <Comparable, T>{};

  Type get argType => K;

  T callCached(K arg) =>
      _cache[hashCode]!.putIfAbsent(arg as Comparable, () => this(arg)) as T;

  static Map<int, Map<dynamic, dynamic>> get cache => _cache;
}
