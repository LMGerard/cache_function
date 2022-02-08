import 'package:cache_function/cache_function.dart';

void main() {
  fibo.initCache();

  final fibo_42 = fibo.callCached(42);

  print(fibo_42);
}

BigInt fibo(num n) {
  if (n < 2) return BigInt.from(n);
  return fibo.callCached(n - 1) + fibo.callCached(n - 2);
}
