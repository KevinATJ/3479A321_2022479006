import 'package:flutter/material.dart';
import 'package:flutter_lab1/appdata.dart';
import 'package:provider/provider.dart';

class AuditPage extends StatelessWidget {
  const AuditPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> actions = Provider.of<AppData>(context).actions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoría'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: actions.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  actions[index],
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

