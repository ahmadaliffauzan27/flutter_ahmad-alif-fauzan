import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soal_prioritas1/theme.dart';
import 'package:supercharged/supercharged.dart';

class CreateNewContact extends StatefulWidget {
  const CreateNewContact({super.key});

  @override
  State<CreateNewContact> createState() => _CreateNewContactState();
}

class _CreateNewContactState extends State<CreateNewContact> {
  var inputController1 = TextEditingController();
  var inputController2 = TextEditingController();

  var formKey1 = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();

  void dispose1() {
    inputController1.dispose();
  }

  void dispose2() {
    inputController1.dispose();
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
            height: 56,
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
                  onPressed: () {},
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
        ],
      ),
    );
  }
}
