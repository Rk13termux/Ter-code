
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ScriptListScreen extends StatefulWidget {
  const ScriptListScreen({super.key});

  @override
  State<ScriptListScreen> createState() => _ScriptListScreenState();
}

class _ScriptListScreenState extends State<ScriptListScreen> {
  List<dynamic> scripts = [];

  @override
  void initState() {
    super.initState();
    _loadScripts();
  }

  Future<void> _loadScripts() async {
    final response = await rootBundle.loadString('assets/scripts.json');
    setState(() {
      scripts = json.decode(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Scripts')),
      body: ListView.builder(
        itemCount: scripts.length,
        itemBuilder: (context, index) {
          final script = scripts[index];
          return Card(
            child: ListTile(
              title: Text(script['title']),
              subtitle: Text(script['description']),
              trailing: Text('${script['downloads']} descargas'),
              onTap: () => Navigator.pushNamed(context, '/script', arguments: script),
            ),
          );
        },
      ),
    );
  }
}
