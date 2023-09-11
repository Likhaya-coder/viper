import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viper/pages/login.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});
  static String id = 'UserList';

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  Future logoutUser() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, Login.id);
  }

  @override
  Widget build(BuildContext context) {
    final currentLoggedUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome ${currentLoggedUser?.email}',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                    double.infinity,
                    70.0,
                  ),
                  backgroundColor: Colors.redAccent,
                ),
                onPressed: logoutUser,
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
