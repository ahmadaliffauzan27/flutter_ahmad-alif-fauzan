import 'dart:io';

void main() {
  stdout.write("Masukkan data (pisahkan dengan spasi): ");
  final freqMap = stdin.readLineSync()!
      .split(' ')
      .fold(<String, int>{}, (map, element) => map..update(element, (value) => value + 1, ifAbsent: () => 1));

  print('Hasil Frekuensi:');
  freqMap.forEach((key, value) => print('$key: $value'));
}
