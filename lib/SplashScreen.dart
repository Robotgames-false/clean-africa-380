import 'dart:async';
import 'package:flutter/material.dart';
import 'loginscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 8),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00FFC4), // Cor ciano
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.10, end: 2.0), // Animação de escala
          duration: Duration(seconds: 10), // Duração da animação
          curve: Curves.easeInOut,
          builder: (context, scale, child) {
            return Transform.scale(
              scale: scale,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    opacity: 1.0,
                    duration: Duration(seconds: 1), // Fade-in
                    child: Icon(
                      Icons.eco,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  AnimatedOpacity(
                    opacity: 1.0,
                    duration: Duration(seconds: 1), // Fade-in
                    child: Text(
                      'Clean Africa',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
