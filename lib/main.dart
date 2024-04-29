import 'package:flutter/material.dart';
import 'splashscreen.dart'; // Importe a tela de splash

void main() {
  runApp(SustainabilityApp());
}

class SustainabilityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Clean',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(), // Tela de splash como tela inicial
    );
  }
}
