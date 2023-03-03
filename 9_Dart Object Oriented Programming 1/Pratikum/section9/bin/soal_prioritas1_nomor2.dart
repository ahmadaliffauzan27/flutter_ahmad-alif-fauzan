class Mobil {
  double kapasitas;
  List<Hewan> muatan = [];

  Mobil({required this.kapasitas});

  void tambahMuatan(Hewan hewan) {
    double totalBeratMuatan = 0;
    for (Hewan h in muatan) {
      totalBeratMuatan += h.berat;
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