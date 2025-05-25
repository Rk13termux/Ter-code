import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/admob_service.dart';

class ScriptViewScreen extends StatelessWidget {
  final Map script;
  const ScriptViewScreen({super.key, required this.script});

  Future<void> _downloadScript(BuildContext context) async {
    final completed = await AdMobService.showRewardedAd();
    if (!completed) return;

    final url = script["url"];
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Script descargado correctamente")),
      );
      // Aquí puedes guardar en almacenamiento si usas path_provider
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error al descargar el script")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(script["title"])),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(script["description"], style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _downloadScript(context),
              child: const Text("Desbloquear y Descargar"),
            ),
          ],
        ),
      ),
    );
  }
}