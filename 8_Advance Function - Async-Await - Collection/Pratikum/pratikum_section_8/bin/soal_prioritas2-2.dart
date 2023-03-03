import 'dart:io';

void main() {
  var sum = 0;
  var count = 0;

  // Membaca input dari user dan menambahkan nilai ke variabel sum
  while (true) {
    stdout.write('Masukkan sebuah angka: ');
    var input = stdin.readLineSync();

    // Mengecek apakah input adalah 'selesai', jika iya maka keluar dari loop
    if (input == 'selesai') {
      break;
    }

    // Mengubah input dari string ke integer, lalu menambahkan nilai ke variabel sum dan count
    var number = int.tryParse(input!);
    if (number != null) {
      sum += number;
      count++;
    }
  }

  // Menghitung rata-rata dan membulatkan hasil ke atas, lalu menampilkannya pada console
  var average = count == 0 ? 0 : (sum / count).ceil();
  print('Rata-rata: $average');
}
