import 'package:flutter/material.dart';
import '../models/script_model.dart';

class ScriptCard extends StatelessWidget {
  final ScriptModel script;

  const ScriptCard({super.key, required this.script});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(
          script.title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          script.description,
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.tealAccent),
        onTap: () {
          Navigator.pushNamed(context, '/view', arguments: script);
        },
      ),
    );
  }
}