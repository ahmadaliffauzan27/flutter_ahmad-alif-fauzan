import '../model/contact_model.dart';

abstract class ContactState {}

class ContactLoading extends ContactState {}

class ContactsLoaded extends ContactState {
  final List<Contact> contacts;

  ContactsLoaded(this.contacts);
}

class ContactError extends ContactState {
  final String message;

  ContactError(this.message);
}
