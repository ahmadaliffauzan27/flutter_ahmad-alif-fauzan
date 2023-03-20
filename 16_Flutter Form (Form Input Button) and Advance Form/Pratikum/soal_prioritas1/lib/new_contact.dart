import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soal_prioritas1/theme.dart';
import 'package:supercharged/supercharged.dart';

class Contact {
  final String name;
  final String number;

  Contact(this.name, this.number);
}

class CreateNewContact extends StatefulWidget {
  const CreateNewContact({Key? key}) : super(key: key);

  @override
  State<CreateNewContact> createState() => _CreateNewContactState();
}

class _CreateNewContactState extends State<CreateNewContact> {
  var inputController1 = TextEditingController();
  var inputController2 = TextEditingController();

  // List<Map<String, dynamic>> contacts = [];
  List<Contact> contacts = [];

  var formKey1 = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();

  void dispose1() {
    inputController1.dispose();
  }

  void dispose2() {
    inputController1.dispose();
  }

  void validateAndSave() {
    final FormState form1 = formKey1.currentState!;
    final FormState form2 = formKey2.currentState!;
    if (form1.validate() && form2.validate()) {
      final name = inputController1.text;
      final number = inputController2.text;

      setState(
        () {
          contacts.add(
            Contact(name, number),
          );
        },
      );
      inputController1.text = '';
      inputController2.text = '';
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Validation Error'),
          content: const Text(
            'Please fill in all required fields',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void saveContact() {
    final name = inputController1.text;
    final number = inputController2.text;
    final newContact = Contact(name, number);
    contacts.add(newContact);

    inputController1.clear();
    inputController2.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contacts',
          style: GoogleFonts.roboto(
            fontSize: 20,
          ),
        ),
        backgroundColor: buttonColor,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 160,
            width: 398,
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Image.asset(
                  'assets/icon.png',
                  width: 17.2,
                  height: 22,
                ),
                const SizedBox(
                  height: 17,
                ),
                Text(
                  'Create New Contacts',
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ',
                      style: GoogleFonts.roboto(
                        color: textColor1,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
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
          Container(
            height: 71,
            width: 397,
            decoration: BoxDecoration(
              color: fillColorForm,
              border: const Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 0.7,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: formKey1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                          ),
                        ),
                        TextField(
                          controller: inputController1,
                          style: const TextStyle(fontSize: 14),
                          maxLines: 1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Insert Your name',
                            hintStyle: TextStyle(fontSize: 14),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 71,
            width: 397,
            decoration: BoxDecoration(
              color: fillColorForm,
              border: const Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 0.5,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: formKey2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Number',
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                          ),
                        ),
                        TextField(
                          controller: inputController2,
                          style: const TextStyle(fontSize: 14),
                          maxLines: 1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '+62 ....',
                            hintStyle: TextStyle(fontSize: 14),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(),
              ),
              SizedBox(
                width: 94,
                child: ElevatedButton(
                  onPressed: () {
                    validateAndSave();
                    saveContact();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 49,
          ),
          Center(
            child: Text(
              'List Contact',
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                final contact = contacts[index];
                return ListTile(
                  title: Text(contact.name),
                  subtitle: Text(contact.number),
                );
              }),
        ],
      ),
    );
  }
}
