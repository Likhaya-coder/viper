import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vapor/pages/home.dart';
import 'package:vapor/pages/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vapor/pages/user_chat.dart';
import 'firebase_options.dart';

import 'pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF6A1313), // Change this to the desired color
      statusBarIconBrightness: Brightness.light, // Adjust the icon color (light/dark)
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: UserChat.id,
      routes: {
        Home.id: (context) => const Home(),
        Login.id: (context) => const Login(),
        Register.id: (context) => const Register(),
        UserChat.id: (context) => const UserChat(),
      },
    ),
  );
}
