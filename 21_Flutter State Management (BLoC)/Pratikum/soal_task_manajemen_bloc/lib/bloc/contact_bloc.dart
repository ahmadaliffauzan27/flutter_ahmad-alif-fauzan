import 'package:flutter_bloc/flutter_bloc.dart';
part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(InitialState()) {
    final List<Map<String, dynamic>> contacts = [];
    on<AddContact>(
      (event, emit) async {
        try {
          emit(
            LoadingState(),
          );

          contacts.add(
            {
              'name': event.name,
              'phone_number': event.phoneNumber,
            },
          );

          await Future.delayed(
            const Duration(seconds: 1),
          );
          emit(
            SuccessState(contacts),
          );
        } catch (e) {
          emit(
            ErrorState(),
          );
        }
      },
    );

    on<RemoveContact>(
      (event, emit) async {
        try {
          emit(
            LoadingState(),
          );

          contacts.removeAt(event.index);

          await Future.delayed(
            const Duration(seconds: 3),
          );
          emit(
            SuccessState(contacts),
          );
        } catch (e) {
          emit(
            ErrorState(),
          );
        }
      },
    );
  }
}
