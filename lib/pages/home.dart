import 'package:flutter/material.dart';
import 'package:viper/pages/login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static String id = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Login.id);
        },
        child: const Text(
          'Login',
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SOMETHING WILL BE HERE IN THE FUTURE!'
            ),
          ],
        ),
      ),
    );
  }
}
