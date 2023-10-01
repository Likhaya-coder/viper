import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserChat extends StatefulWidget {
  static String id = "UserChat";
  const UserChat({super.key});

  @override
  State<UserChat> createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
  @override

  User? loggedInUser = FirebaseAuth.instance.currentUser;

  Widget build(BuildContext context) {
    String? email = loggedInUser?.email;
    return Scaffold(
      appBar: AppBar(
        title: Text('$email'),
      ),
    );
  }
}
