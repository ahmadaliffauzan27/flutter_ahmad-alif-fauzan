import 'FaktorPersekutuanTerbesar.dart';
import 'KelipatanPersekutuanTerkecil.dart';

void main() {
KelipatanPersekutuanTerkecil kpk =  KelipatanPersekutuanTerkecil(2, 4);
print("KPK dari 2 dan 4 adalah ${kpk.hasil(kpk.x, kpk.y)}");

FaktorPersekutuanTerbesar fpb =  FaktorPersekutuanTerbesar(6, 9);
print("FPB dari 6 dan 9 adalah ${fpb.hasil(fpb.x, fpb.y)}");
}