part of 'contact_bloc.dart';

abstract class ContactEvent {}

class AddContact extends ContactEvent {
  final String name;
  final String phoneNumber;

  AddContact({
    required this.name,
    required this.phoneNumber,
  });
}

class RemoveContact extends ContactEvent {
  final int index;

  RemoveContact({required this.index});
}
