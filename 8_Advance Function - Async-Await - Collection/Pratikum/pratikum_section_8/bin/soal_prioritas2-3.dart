import 'dart:io';

void main() async {
  stdout.write('Masukkan bilangan bulat positif: ');
  int n = int.parse(stdin.readLineSync()!);

  int factorial = await computeFactorial(n);
  
  print('Faktorial dari $n adalah $factorial');
}

Future<int> computeFactorial(int n) async {
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }
  return result;
}
