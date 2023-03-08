import 'Matematika.dart';

class KelipatanPersekutuanTerkecil implements Matematika{
  double x;
  double y;

  KelipatanPersekutuanTerkecil(this.x, this.y);
  
  @override
  double hasil(double x, double y) {
    double i = 1;
    while(true) {
      if (i % x == 0 && i % y == 0) {
        return i;
      }
      i++;
    }
  }
}
