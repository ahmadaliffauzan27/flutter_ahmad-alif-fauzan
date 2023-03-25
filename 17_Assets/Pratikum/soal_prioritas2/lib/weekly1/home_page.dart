import 'package:flutter/material.dart';
import 'theme.dart';
import 'input_decoration.dart';

class Contact {
  late String firstName;
  late String lastName;
  late String email;
  late String helpForm;

  Contact(this.firstName, this.lastName, this.email, this.helpForm);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class _HomePageState extends State<HomePage> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nameController2 = TextEditingController();
  final _nameController3 = TextEditingController();
  final _nameController4 = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _nameController2.dispose();
    _nameController3.dispose();
    _nameController4.dispose();
  }

  List<Contact> contactList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 50, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 50,
                      child: Image.asset('assets/logo.png'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Welcome to\nMobile Apps Flutter!',
                      style: title,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Stop membuang banyak waktu\npada tempat yang tidak habitable',
                      style: subtitle,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Form(
                          key: _formKey1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'First Name',
                                style: label,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 153,
                                child: TextFormField(
                                  controller: _nameController,
                                  decoration:
                                      InputDecorationStyle.inputDecorationStyle(
                                    'First name',
                                  ).copyWith(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please input your first name';
                                    }
                                    if (!RegExp(r'^[a-zA-Z\s]+$')
                                        .hasMatch(value)) {
                                      return 'Name cannot contain numbers or special characters';
                                    } else {
                                      List<String> words =
                                          value.trim().split(" ");
                                      for (int i = 0; i < words.length; i++) {
                                        words[i] =
                                            words[i].toLowerCase().capitalize();
                                        if (words[i][0] !=
                                            value.trim().split(" ")[i][0]) {
                                          return 'Each word must start with a capital letter';
                                        }
                                      }
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Form(
                          key: _formKey2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Last Name',
                                style: label,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 153,
                                child: TextFormField(
                                  controller: _nameController2,
                                  decoration:
                                      InputDecorationStyle.inputDecorationStyle(
                                    'Last name',
                                  ).copyWith(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please input your last name';
                                    }
                                    if (!RegExp(r'^[a-zA-Z\s]+$')
                                        .hasMatch(value)) {
                                      return 'Name cannot contain numbers or special characters';
                                    } else {
                                      List<String> words =
                                          value.trim().split(" ");
                                      for (int i = 0; i < words.length; i++) {
                                        words[i] =
                                            words[i].toLowerCase().capitalize();
                                        if (words[i][0] !=
                                            value.trim().split(" ")[i][0]) {
                                          return 'Each word must start with a capital letter';
                                        }
                                      }
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Email',
                        style: label,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 315,
                        child: TextFormField(
                          controller: _nameController3,
                          decoration: InputDecorationStyle.inputDecorationStyle(
                            'e.g ahmadaliffauzan@gmail.com',
                          ).copyWith(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input your email';
                            }

                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'What can we help you with?',
                        style: label,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 315,
                        child: TextFormField(
                          controller: _nameController4,
                          maxLines: 5,
                          decoration: InputDecorationStyle.inputDecorationStyle(
                            '',
                          ).copyWith(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please input your name';
                            }
                            if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                              return 'Name cannot contain numbers or special characters';
                            }

                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor)),
                  onPressed: () {
                    if (_formKey1.currentState!.validate() &&
                        _formKey2.currentState!.validate() &&
                        _formKey3.currentState!.validate() &&
                        _formKey4.currentState!.validate()) {
                      String firstName = _nameController.text;
                      String lastName = _nameController2.text;
                      String email = _nameController3.text;
                      String helpForm = _nameController4.text;

                      Contact newContact =
                          Contact(firstName, lastName, email, helpForm);
                      setState(() {
                        contactList
                            .add(Contact(firstName, lastName, email, helpForm));
                      });

                      _nameController.clear();
                      _nameController2.clear();
                      _nameController3.clear();
                      _nameController4.clear();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Data Berhasil Disimpan'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Submit',
                    style: label.copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Center(
                //   child: Text(
                //     'List data',
                //     style: title,
                //   ),
                // ),
                // const SizedBox(
                //   height: 30,
                // ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: contactList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final contact = contactList[index];
                      final color = secondaryColor;
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: color,
                              child: Text(
                                contact.firstName.substring(0, 1),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            title: Text(
                              contact.firstName + ' ' + contact.lastName,
                              style:
                                  label.copyWith(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contact.email,
                                  style: label.copyWith(fontSize: 10),
                                ),
                                Text(
                                  contact.helpForm,
                                  style: label.copyWith(fontSize: 10),
                                )
                              ],
                            ),
                            trailing: Wrap(
                              spacing: -18,
                              children: [
                                IconButton(
                                    icon: const Icon(Icons.edit),
                                    color: primaryColor,
                                    onPressed: () async {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                side: BorderSide(
                                                    color: primaryColor)),
                                            title: const Text('Konfirmasi'),
                                            content: const Text(
                                                'Apakah Anda ingin mengedit kontak ini?'),
                                            actions: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: primaryColor),
                                                child: const Text('Tidak'),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: primaryColor),
                                                child: const Text('Ya'),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  // _showEditDialog(contact);
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }),
                                IconButton(
                                    icon: const Icon(Icons.delete),
                                    color: primaryColor,
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                side: BorderSide(
                                                    color: primaryColor)),
                                            title: const Text('Konfirmasi'),
                                            content: const Text(
                                                'Apakah Anda yakin ingin menghapus kontak ini?'),
                                            actions: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: primaryColor),
                                                child: const Text('Tidak'),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: primaryColor),
                                                child: const Text('Ya'),
                                                onPressed: () {
                                                  setState(() {
                                                    contactList.removeAt(index);
                                                  });
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                          'Data Berhasil Dihapus'),
                                                      backgroundColor:
                                                          Colors.red,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    })
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 150,
              child: Container(
                color: secondaryColor,
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact us',
                        style: title.copyWith(
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 5,
                                offset: const Offset(2, 2))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Need to get in touch with us? Ether fill out the\nform with yout inquiry of find the departmen\nemail you’d like to contact bellow.',
                            style: label.copyWith(
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 5,
                                    offset: const Offset(2, 2))
                              ],
                            ),
                          ),
                          Icon(
                            Icons.mail,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 5,
                                  offset: const Offset(2, 2))
                            ],
                            size: 30,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
