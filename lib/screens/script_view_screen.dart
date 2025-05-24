import 'package:flutter/material.dart';
import '../models/script_model.dart';
import '../services/admob_service.dart';

class ScriptViewScreen extends StatelessWidget {
  const ScriptViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScriptModel script = ModalRoute.of(context)!.settings.arguments as ScriptModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(script.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              script.description,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await AdMobService.showInterstitialAd();
                // Llamar al servicio para descargar desde Heroku
                Navigator.pushNamed(context, '/scripts');
              },
              child: const Text('Desbloquear Script'),
            ),
          ],
        ),
      ),
    );
  }
}