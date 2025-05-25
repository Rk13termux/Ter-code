
import 'package:flutter/material.dart';

class ScriptDetailScreen extends StatelessWidget {
  const ScriptDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final script = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text(script['title'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Autor: ${script['author']}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Versión: ${script['version']}'),
            Text('Creado: ${script['created']}'),
            Text('Lenguaje: ${script['language']}'),
            Text('Requisitos: ${script['requirements']}'),
            const SizedBox(height: 16),
            Text(script['description']),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Lógica de descarga aquí
                },
                child: const Text('Descargar Script'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
