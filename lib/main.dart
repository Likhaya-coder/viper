import 'package:flutter/material.dart';
import 'package:vapor/pages/home.dart';
import 'package:vapor/pages/register.dart';

import 'pages/login.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => const Home(),
        Login.id: (context) => const Login(),
        Register.id: (context) => const Register(),
      },
    ),
  );
}
