import 'package:flutter/material.dart';
import 'package:vapor/constants.dart';
import 'package:vapor/pages/register.dart';
import 'package:vapor/utilities/glassmorphism.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  static String id = 'Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black54),
                  decoration: inputDecoration.copyWith(
                    hintText: 'Enter your password',
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
                      'Don\'t have an account? ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Register.id);
                      },
                      child: const Text(
                        ' Register now',
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
                onPressed: () {},
                child: const Text('Login'),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
