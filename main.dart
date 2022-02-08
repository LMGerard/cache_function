import 'package:cache_function/cache_function.dart';

void main() {
  fibo.initCache();

  myFunc.initCache();

  print(myFunc.callCached(10, 20));
  print(myFunc.callCached(10, 20));
  print(CacheFunction2.cache);
}

BigInt fibo(num n) {
  if (n < 2) return BigInt.from(n);
  return fibo.callCached(n - 1) + fibo.callCached(n - 2);
}

int myFunc(int n, int m) {
  print('yo');
  return n * m;
}
