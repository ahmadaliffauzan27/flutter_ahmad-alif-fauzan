class Contact {
  late int? id;
  late String name;
  late String number;

  Contact({
    required this.id,
    required this.name,
    required this.number,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
    };
  }

  Contact.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    number = map['number'];
  }
}
