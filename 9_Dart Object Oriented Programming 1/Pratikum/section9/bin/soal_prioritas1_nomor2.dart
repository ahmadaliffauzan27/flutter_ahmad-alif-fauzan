class Mobil {
  double kapasitas; //properti 1

  List<Hewan> muatan = []; //properti 2

  Mobil({required this.kapasitas}); //Konstruktor dengan parameter kapasitas

  void tambahMuatan(Hewan hewan) { //method tambahMuatan
    double totalBeratMuatan = 0;
    for (Hewan hewan in muatan) { // Menambah sebuah objek Hewan ke dalam muatan
      totalBeratMuatan += hewan.berat; 
    }

    if (totalBeratMuatan + hewan.berat <= kapasitas) {
      muatan.add(hewan);
      print('${hewan.nama} berhasil ditambahkan ke muatan');
    } else {
      print('Kapasitas muatan tidak mencukupi');
    }
  }
}

class Hewan {
  String nama;
  double berat;

  Hewan({required this.nama, required this.berat});
}

void main(){
  Mobil mobil = Mobil(kapasitas: 50);
  
  Hewan ayam = Hewan(nama: 'Ayam', berat: 5);
  mobil.tambahMuatan(ayam);

  Hewan capybara = Hewan(nama: 'Capybara', berat: 14);
  mobil.tambahMuatan(capybara);

  Hewan kuda = Hewan(nama: 'Kuda', berat: 60);
  mobil.tambahMuatan(kuda);

}