import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soal_state_manajement_bloc/bloc/contact_bloc.dart';
import 'package:soal_state_manajement_bloc/model/contact_model.dart';
import 'package:soal_state_manajement_bloc/theme.dart';

import 'bloc/contact_event.dart';
import 'bloc/contact_state.dart';
import 'create_contact.dart';

class MyHomePage extends StatelessWidget {
  final ContactBloc _contactBloc = ContactBloc();

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactBloc>(
      create: (_) => _contactBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Contacts',
            style: titleFont,
          ),
          backgroundColor: primaryColor,
        ),
        body: ContactList(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: _contactBloc,
                  child: CreateContactPage(),
                ),
              ),
            );
          },
          tooltip: 'Add Contact',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        if (state is ContactLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ContactsLoaded) {
          return ListView.builder(
            itemCount: state.contacts.length,
            itemBuilder: (context, index) {
              final Contact contact = state.contacts[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: secondaryColor,
                  child: Text(
                    contact.name[0],
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                title: Text(contact.name),
                subtitle: Text(contact.phoneNumber),
              );
            },
          );
        } else if (state is ContactError) {
          return Center(
            child: Text('Error: ${state.message}'),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
