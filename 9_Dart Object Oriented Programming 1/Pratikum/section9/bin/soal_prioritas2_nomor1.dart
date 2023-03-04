class Calculator {
  double tambah(double a, double b) { //deklarasi parameter
    return a + b; // mengembalikan nilai
  }

  double kurang(double a, double b) {
    return a - b;
  }

  double kali(double a, double b) {
    return a * b;
  }

  double bagi(double a, double b) {
    return a / b;
  }
}

void main() {

  var kalkulator = Calculator();
  
  double hasilTambah = kalkulator.tambah(4, 5); // parameter atau argument
  double hasilKurang = kalkulator.kurang(10, 3);
  double hasilKali = kalkulator.kali(6, 8);
  double hasilBagi = kalkulator.bagi(100, 20);
  
  print('Hasil penjumlahan: $hasilTambah');
  print('Hasil pengurangan: $hasilKurang');
  print('Hasil perkalian: $hasilKali');
  print('Hasil pembagian: $hasilBagi');
}
