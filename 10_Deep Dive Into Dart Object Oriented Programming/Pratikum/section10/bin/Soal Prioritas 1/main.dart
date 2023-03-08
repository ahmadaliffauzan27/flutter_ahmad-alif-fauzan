import 'bangunRuang.dart';
import 'kubus.dart';
import 'balok.dart';

void main(){

  BangunRuang bRuang = BangunRuang();
  bRuang.panjang = 4;
  bRuang.lebar = 5;
  bRuang.tinggi = 6;
  print('Volume Bangun Ruang adalah ${bRuang.volume()}');

  Kubus kubus = Kubus();
  kubus.sisi = 4;
  print('Volume Kubus adalah ${kubus.volume()}');

  Balok balok = Balok();
  balok.panjang = 5;
  balok.lebar = 6;
  balok.tinggi = 7;
  print('Volume Balok adalah ${balok.volume()}');

  // contoh penggunaan method overriding
  // BangunRuang bRuang = Kubus();
  // (bRuang as Kubus).sisi = 4;
  // print('Volume kubus (dengan method overriding): ${bRuang.volume()}');
  
  // bRuang = Balok();
  // bRuang.panjang = 5;
  // bRuang.lebar = 6;
  // bRuang.tinggi = 7;
  // print('Volume balok (dengan method overriding): ${bRuang.volume()}');
}