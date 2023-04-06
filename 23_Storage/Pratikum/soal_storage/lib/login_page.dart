import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soal_storage/new_contact.dart';
import 'package:soal_storage/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLowercase(String str) {
    return str == str.toLowerCase();
  }

  final _formKey = GlobalKey<FormState>();

  late SharedPreferences logindata;
  late bool newUser;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    logindata = await SharedPreferences.getInstance();
    newUser = logindata.getBool('login') ?? true;

    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateNewContact(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: titleFont,
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset('assets/login.png'),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Hello',
                    style: titleFont.copyWith(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Sign In to your account!',
                    style: subtitleName,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Username',
                    style: subtitleName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _usernameController,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'Input username',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter username';
                      } else if (!isLowercase(value[0])) {
                        return "Username harus menggunakan huruf kecil";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Password',
                    style: subtitleName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'Input password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'Password harus berisi minimal 8 karakter';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot your password?',
                      style: subtitleName.copyWith(fontSize: 11),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primaryColor),
                      ),
                      onPressed: () {
                        final isValidForm = _formKey.currentState!.validate();

                        String username = _usernameController.text;
                        if (isValidForm) {
                          logindata.setBool('login', false);
                          logindata.setString('username', username);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CreateNewContact(),
                              ),
                              (route) => false);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Login Berhasil!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                      child: Text(
                        'SIGN IN',
                        style: subtitleName,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
