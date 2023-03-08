import 'dart:io';
void main() {
  stdout.write('Masukkan jumlah kolom dan baris: ');
  int num = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= num; i++) {
    for (int j = 1; j <= num; j++) {
      // Menggunakan padLeft untuk menambahkan spasi pada kolom
      String value = (i * j).toString().padRight(2);
      stdout.write('$value ');
    }
    print(''); // Pindah ke baris berikutnya setelah selesai menampilkan kolom
  }
}
