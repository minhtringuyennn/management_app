import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "MÀN HÌNH CHÍNH",
          style: const TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
