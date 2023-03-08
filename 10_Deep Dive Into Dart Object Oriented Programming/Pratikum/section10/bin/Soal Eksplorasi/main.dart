import 'Circle.dart';
import 'Square.dart';
import 'Rectangle.dart';

void main() {
Circle lingkaran = Circle(7);
Square persegi = Square(4);
Rectangle persegiPanjang = Rectangle(6, 2);

print("Circle atau Lingkaran dengan Jari-jari 7:");
print("Luas: ${lingkaran.getArea()}");
print("Keliling: ${lingkaran.getPerimeter()}");
print('------------------------------------------');

print("Square atau Persegi dengan Panjang sisi 4:");
print("Luas: ${persegi.getArea()}");
print("Keliling: ${persegi.getPerimeter()}");
print('------------------------------------------');

print("Rectangle atau Persegi Panjang dengan Panjang 6 dan Lebar 2:");
print("Luas: ${persegiPanjang.getArea()}");
print("Keliling: ${persegiPanjang.getPerimeter()}");
print('------------------------------------------');
}