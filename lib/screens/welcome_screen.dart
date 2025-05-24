import 'package:flutter/material.dart';
import 'dart:async';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String _terminalText = '';
  final String _fullText = '''
Iniciando sistema...
Cargando módulos...
Verificando scripts...
Listo. Ejecutando interfaz...
''';
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    Timer.periodic(const Duration(milliseconds: 60), (timer) {
      if (_index < _fullText.length) {
        setState(() {
          _terminalText += _fullText[_index];
          _index++;
        });
      } else {
        timer.cancel();
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacementNamed(context, '/');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            _terminalText,
            style: const TextStyle(
              color: Colors.greenAccent,
              fontFamily: 'Courier',
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}