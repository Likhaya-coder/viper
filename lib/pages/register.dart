import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viper/constants.dart';
import 'package:viper/pages/login.dart';
import 'package:viper/pages/user_list.dart';

import '../utilities/glassmorphism.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  static String id = 'Register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //getting user inputs
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _passwordRepeat = TextEditingController();

  Future registerUser() async {
    try {
      if (_password.text.trim() == _passwordRepeat.text.trim()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text.trim(),
          password: _password.text.trim(),
        );
        userData(_username.text.trim(), _email.text.trim());
        if (context.mounted) {
          Navigator.pushNamed(context, UserList.id);
        }
      }
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text(e.message.toString()));
        },
      );
    }
  }

  Future userData(String username, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'username': username,
      'email': email,
    });
  }

  @override
  void dispose() {
    _username;
    _email;
    _password;
    _passwordRepeat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Glassmorphism(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Icon(
                  Icons.car_crash,
                  size: 160.0,
                  color: Colors.redAccent,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: _username,
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black54),
                    decoration: inputDecoration.copyWith(
                      hintText: 'Enter your username',
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black54),
                    decoration: inputDecoration.copyWith(
                      hintText: 'Enter your email',
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    obscureText: true,
                    controller: _password,
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black54),
                    decoration: inputDecoration.copyWith(
                      hintText: 'Enter your password',
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordRepeat,
                    cursorColor: Colors.black,
                    style: const TextStyle(color: Colors.black54),
                    decoration: inputDecoration.copyWith(
                      hintText: 'Repeat your password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Already a member? ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Login.id);
                        },
                        child: const Text(
                          ' Sign in here',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(
                      double.infinity,
                      70.0,
                    ),
                    backgroundColor: Colors.redAccent,
                  ),
                  onPressed: registerUser,
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
