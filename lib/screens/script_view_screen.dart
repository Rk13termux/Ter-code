import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';

import '../models/script_model.dart';
import '../services/admob_service.dart';
import '../services/heroku_service.dart';

class ScriptViewScreen extends StatelessWidget {
  const ScriptViewScreen({super.key});

  Future<void> _descargarScript(BuildContext context, ScriptModel script) async {
    final status = await Permission.storage.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Permiso de almacenamiento denegado.')));
      return;
    }

    final downloadUrl = await HerokuService.fetchDownloadUrl(script.id, 'free_user_token');
    if (downloadUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error al obtener el script.')));
      return;
    }

    try {
      final dir = Directory('/storage/emulated/0/Download');
      final filePath = '${dir.path}/${script.id}.py';
      await Dio().download(downloadUrl, filePath);

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Script descargado'),
          content: Text('Archivo guardado como ${script.id}.py en la carpeta Descargas'),
          actions: [
            TextButton(
              onPressed: () {
                final uri = Uri.parse('termux://com.termux/file${filePath}');
                launchUrl(uri);
              },
              child: const Text('Abrir en Termux'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      );
    } catch (e) {
      print('Error descargando el script: $e');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Fallo al descargar.')));
    }
  }

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
            Text(script.description, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                AdMobService.loadRewardedAd(() {
                  _descargarScript(context, script);
                });
              },
              child: const Text('Desbloquear y Descargar Script'),
            ),
          ],
        ),
      ),
    );
  }
}