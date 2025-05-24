import 'package:flutter/material.dart';

class ProUnlockScreen extends StatelessWidget {
  const ProUnlockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Versión PRO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Desbloquea el poder total',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Accede a todos los scripts sin anuncios, sin restricciones y con contenido exclusivo PRO.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Aquí conectarás lógica de activación PRO
              },
              child: const Text('Activar ahora'),
            ),
          ],
        ),
      ),
    );
  }
}