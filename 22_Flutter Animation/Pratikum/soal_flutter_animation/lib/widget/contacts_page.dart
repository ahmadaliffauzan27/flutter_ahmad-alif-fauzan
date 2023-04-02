import 'package:flutter/material.dart';
import 'package:soal_flutter_animation/provider/contact_provider.dart';
import 'package:provider/provider.dart';
import '../shared/theme.dart';
import 'create_contact_page.dart';
import 'edit_contact_page.dart';

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
          'Contacts',
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
        child: Builder(builder: (context) {
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
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => EditContactPage(
                                contact: contact,
                              ),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return ScaleTransition(
                                  scale: Tween<double>(
                                    begin: 0.0,
                                    end: 1.0,
                                  ).animate(animation),
                                  child: child,
                                );
                              },
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                            ),
                          );
                        },
                      ));
                });
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
              },
              transitionDuration: const Duration(milliseconds: 500),
            ),
          );
        },
        child: const Icon(Icons.add),
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
