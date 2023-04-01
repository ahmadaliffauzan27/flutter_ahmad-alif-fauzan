import '../model/contact_model.dart';

abstract class ContactEvent {}

class AddContact extends ContactEvent {
  final Contact contact;

  AddContact(this.contact);
}

class LoadContacts extends ContactEvent {}
