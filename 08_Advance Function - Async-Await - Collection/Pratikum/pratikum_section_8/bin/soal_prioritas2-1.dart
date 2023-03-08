void main() {
  List<List<int>> dataList = [
    [11, 5],
    [6, 7],
    [8, 3],
    [3, 1],
  ];

  Map<int, List<int>> dataMap = {};

  for (int i = 0; i < dataList.length; i++) {
    dataMap[i] = dataList[i];
  }

  print(dataMap);
}
