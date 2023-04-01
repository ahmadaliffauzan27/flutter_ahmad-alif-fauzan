class Contact {
  String name;
  String phoneNumber;

  Contact(this.name, this.phoneNumber);
}

class EmptyContactList {
  List<Contact> get contacts => [];
}
