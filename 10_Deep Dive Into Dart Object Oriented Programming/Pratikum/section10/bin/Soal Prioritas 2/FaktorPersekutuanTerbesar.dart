import 'Matematika.dart';

class FaktorPersekutuanTerbesar implements Matematika {
  double x, y;

  FaktorPersekutuanTerbesar(this.x, this.y);

  @override
  double hasil(double x, double y) {
    while(x != y) {
      if (x > y) {
        x = x - y;
      } else {
        y = y - x;
      }
    }
    return x;
  }
}
