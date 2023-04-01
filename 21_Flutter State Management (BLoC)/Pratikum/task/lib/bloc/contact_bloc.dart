import 'package:bloc/bloc.dart';
import 'package:soal_state_manajement_bloc/model/contact_model.dart';

import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  List<Contact> _contacts = EmptyContactList().contacts;

  ContactBloc() : super(ContactLoading()) {
    on<AddContact>((event, emit) {
      _contacts.add(event.contact);
      emit(ContactsLoaded(_contacts));
    });
  }

  @override
  Stream<ContactState> mapEventToState(
    ContactEvent event,
  ) async* {
    if (event is LoadContacts) {
      yield ContactsLoaded(_contacts);
    }
  }
}
