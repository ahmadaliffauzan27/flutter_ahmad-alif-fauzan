import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme.dart';
import '../bloc/contact_bloc.dart';

/// FormPrio2 with BLoC bloc
/// Digunakan untuk tugas implementasi BLoC
class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  // Controller
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // Key
  final formKey = GlobalKey<FormState>();

  /// Validasi nama
  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return "Nama Tidak Boleh Kosong";
    } else if (!isUppercase(name[0])) {
      return "Nama Harus Menggunakan Huruf Kapital";
    } else if (name.split(' ').length < 2) {
      return "Nama Harus Terdiri dari 2 Kata";
    } else if (name.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')) ||
        name.contains(RegExp(r'[0-9]'))) {
      return "Nama Harus Alphabet";
    } else {
      return null;
    }
  }

  bool isUppercase(String str) {
    return str == str.toUpperCase();
  }

  /// Validasi nomor telepon
  String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Nomor Telepon Tidak Boleh Kosong";
    } else if (phone.length < 8 || phone.length > 15) {
      return "Nomor Telepon Harus 8-15 Digit";
    } else if (phone[0] != '0') {
      return "Nomor Telepon Harus Dimulai Dengan Angka 0";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Contacts',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: buttonColor,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
        ),
        children: [
          const SizedBox(
            height: 25,
          ),
          Center(
            child: Image.asset(
              'assets/icon.png',
              width: 17.2,
              height: 22,
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          const Center(
            child: Text(
              'Create New Contacts',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const SizedBox(
            height: 50,
            width: 400,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          // Form
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        validator: validateName,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Name',
                          filled: true,
                          fillColor: fillColorForm,
                          hintText: "Insert Your Name",
                          hintStyle: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: phoneController,
                        validator: validatePhone,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Nomor',
                          hintText: '08xx',
                          filled: true,
                          fillColor: fillColorForm,
                          hintStyle: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 94,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<ContactBloc>().add(
                              AddContact(
                                  name: nameController.text,
                                  phoneNumber: phoneController.text),
                            );

                        nameController.clear();
                        phoneController.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 49,
          ),

          //  List Contact
          const Center(
            child: Text(
              'List Contact',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<ContactBloc, ContactState>(
            builder: (context, state) {
              if (state is InitialState) {
                return const Center(
                  child: Text('Belum ada kontak yang ditambahkan'),
                );
              } else if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SuccessState) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: state.contacts.length,
                  itemBuilder: (context, index) {
                    final contact = state.contacts[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: circleAvatar,
                        child: Text(
                          contact['name'][0],
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      title: Text(
                        contact['name'],
                      ),
                      subtitle: Text(
                        contact['phone_number'],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Button Update
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                          ),

                          // Button Delete
                          IconButton(
                            onPressed: () {
                              context.read<ContactBloc>().add(
                                    RemoveContact(index: index),
                                  );
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (state is ErrorState) {
                return const Center(
                  child: Text("Something's happen"),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
