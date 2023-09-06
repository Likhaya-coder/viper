import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Glassmorphism extends StatelessWidget {
  const Glassmorphism({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'images/background.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          scale: 1,
        ),
        SafeArea(
          child: Center(
            child: GlassmorphicContainer(
              width: 350,
              height: 550,
              borderRadius: 20,
              blur: 10,
              alignment: Alignment.bottomCenter,
              border: 2,
              linearGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.1),
                    Color(0xFFFFFFFF).withOpacity(0.05),
                  ],
                  stops: [
                    0.1,
                    1,
                  ]),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFffffff).withOpacity(0.5),
                  Color((0xFFFFFFFF)).withOpacity(0.5),
                ],
              ),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
