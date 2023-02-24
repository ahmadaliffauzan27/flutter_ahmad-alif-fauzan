import 'dart:io';
void main() {
  for (int i = 1; i <= 9; i++) {
    for (int j = 1; j <= 9; j++) {
      // Menggunakan padLeft untuk menambahkan spasi pada kolom
      String value = (i * j).toString().padLeft(2);
      stdout.write('$value ');
    }
    print(''); // Pindah ke baris berikutnya setelah selesai menampilkan kolom
  }
}
