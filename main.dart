import 'package:cache_function/cache_function.dart';

void main() {
  fibo.initCache();

  print(fibo.callCached(1000));
}

BigInt fibo(num n) {
  if (n < 2) return BigInt.from(n);
  return fibo.callCached(n - 1) + fibo.callCached(n - 2);
}
