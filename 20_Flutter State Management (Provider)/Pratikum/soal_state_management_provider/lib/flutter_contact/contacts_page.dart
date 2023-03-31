import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/contact_provider.dart';
import '../theme.dart';
import 'contact.dart';
import 'create_contact_page.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<ContactProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contacts App',
          style: titleFont,
        ),
        backgroundColor: primaryColor,
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.add),
        //     onPressed: () {
        //       Navigator.pushNamed(context, '/create');
        //     },
        //   ),
        // ],
      ),
      body: ScrollConfiguration(
        behavior: MyBehaviour(),
        child: Consumer<ContactProvider>(builder: (context, appState, _) {
          if (appState.contacts.isEmpty) {
            return Center(
              child: Text(
                'Belum ada kontak yang ditambahkan',
                style: subtitleName,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: appState.contacts.length,
              itemBuilder: (context, index) {
                final contact = appState.contacts[index];
                return ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundColor: secondaryColor,
                    child: Text(
                      contact.name[0],
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                  title: Text(contact.name),
                  subtitle: Text(contact.phoneNumber),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
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
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: primaryColor)),
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
                                        _showEditDialog(contact);
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
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: primaryColor)),
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
                                          appState.contacts.removeAt(index);
                                        });
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text('Data Berhasil Dihapus'),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }),
                    ],
                  ),
                );
              },
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => CreateContactPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return ScaleTransition(
                  scale: Tween<double>(
                    begin: 0.0,
                    end: 1.0,
                  ).animate(animation),
                  child: child,
                );

                // return SlideTransition(
                //   position: Tween<Offset>(
                //     begin: const Offset(1, 0),
                //     end: Offset.zero,
                //   ).animate(animation),
                //   child: child,
                // );

                // return RotationTransition(
                //   turns: Tween<double>(
                //     begin: 0,
                //     end: 1,
                //   ).animate(animation),
                //   child: child,
                // );

                // return FadeTransition(
                //   opacity: Tween<double>(
                //     begin: 0,
                //     end: 1,
                //   ).animate(animation),
                //   child: child,
                // );
              },
              transitionDuration: const Duration(milliseconds: 500),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showEditDialog(Contact contact) async {
    TextEditingController nameController =
        TextEditingController(text: contact.name);
    TextEditingController numberController =
        TextEditingController(text: contact.phoneNumber);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: primaryColor)),
        title: Text('Edit Contact'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
            TextFormField(
              controller: numberController,
              decoration: InputDecoration(
                hintText: 'Number',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              nameController.dispose();
              numberController.dispose();
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: primaryColor),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: primaryColor),
            onPressed: () {
              setState(() {
                contact.name = nameController.text;
                contact.phoneNumber = numberController.text;
              });

              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Data Berhasil Diedit'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}

class MyBehaviour extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
