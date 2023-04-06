class Contact {
  late int? id;
  late String name;
  late String number;

  Contact({this.id, required this.name, required this.number});

  // fungsi toMap
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
    };
  }

  // fungsi fromMap
  Contact.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    number = map['number'];
  }
}
