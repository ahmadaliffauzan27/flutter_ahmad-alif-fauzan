import 'dart:io';

void main() {
  // Minta input dari user
  stdout.write("Masukkan data (pisahkan dengan koma',') : ");
  String input = stdin.readLineSync()!;
  
  // Buat list dari input
  List<String> dataList = input.split(", ");
  
  // Buat set dari gabungan semua list untuk menghilangkan nilai yang sama
  Set<String> dataSet = Set<String>.from(dataList);
  
  // Konversi kembali ke list dan urutkan
  List<String> uniqueList = dataSet.toList();
  // List<String> uniqueList = dataSet.toList()..sort();

  
  // Cetak hasil
  print("Data unik: ${uniqueList.join(", ")}");
}
