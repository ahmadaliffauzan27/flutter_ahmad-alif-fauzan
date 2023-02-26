Future<List<int>> multiplyList(List<int> data, int pengali) async {
  List<int> result = [];

  for (int i = 0; i < data.length; i++) {
    int multipliedValue = data[i] * pengali;
    result.add(multipliedValue);
  }

  return result;
}

void main() async {
  List<int> data = [1, 2, 3, 4, 5];
  int pengali = 2;

  List<int> multipliedList = await multiplyList(data, pengali);

  print("Data asli: $data");
  print("Pengali: $pengali");
  print("Hasil perkalian: $multipliedList");
}
