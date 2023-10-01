import 'package:flutter/material.dart';
import 'package:vapor/components/tabbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static String id = 'Home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(child: Tabs()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
