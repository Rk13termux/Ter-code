import 'package:flutter/material.dart';
import '../models/script_model.dart';
import '../widgets/script_card.dart';

class ScriptListScreen extends StatelessWidget {
  const ScriptListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ScriptModel> scripts = [
      ScriptModel(
        id: 'wifi_attack',
        title: 'Ataque WiFi Básico',
        description: 'Script para escaneo de redes WiFi con herramientas básicas.',
      ),
      ScriptModel(
        id: 'port_scan',
        title: 'Escáner de Puertos',
        description: 'Analiza puertos abiertos en la red local.',
      ),
      ScriptModel(
        id: 'osint_toolkit',
        title: 'Kit OSINT',
        description: 'Herramientas para recolectar información desde internet.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scripts Disponibles'),
      ),
      body: ListView.builder(
        itemCount: scripts.length,
        itemBuilder: (context, index) {
          return ScriptCard(script: scripts[index]);
        },
      ),
    );
  }
}