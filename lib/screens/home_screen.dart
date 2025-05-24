import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio del sistema'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a Termux Scripts PRO',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'Courier',
          ),
        ),
      ),
    );
  }
}