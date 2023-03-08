import 'bangunRuang.dart';

class Kubus extends BangunRuang{
  late double sisi;

  @override
  double volume(){
    return sisi * sisi * sisi;
  }
}