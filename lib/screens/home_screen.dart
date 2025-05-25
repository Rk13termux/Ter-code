import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'script_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> scripts = [];

  @override
  void initState() {
    super.initState();
    loadScripts();
  }

  Future<void> loadScripts() async {
    final jsonStr = await rootBundle.loadString('assets/scripts.json');
    setState(() {
      scripts = jsonDecode(jsonStr);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Centro de Scripts Termux')),
      body: ListView.builder(
        itemCount: scripts.length,
        itemBuilder: (context, index) {
          final script = scripts[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(script["title"]),
              subtitle: Text(script["description"]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ScriptViewScreen(script: script),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}