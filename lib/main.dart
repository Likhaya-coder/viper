import 'package:flutter/material.dart';
import 'package:viper/pages/home.dart';
import 'package:viper/pages/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:viper/pages/user_list.dart';
import 'firebase_options.dart';

import 'pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => const Home(),
        Login.id: (context) => const Login(),
        Register.id: (context) => const Register(),
        UserList.id: (context) => const UserList(),
      },
    ),
  );
}
