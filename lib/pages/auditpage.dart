import 'package:flutter/material.dart';
import 'package:flutter_lab1/appdata.dart';
import 'package:provider/provider.dart';
import 'package:flutter_lab1/auditclass.dart'; 
import 'package:flutter_lab1/utils/databasehelper.dart'; 


class AuditPage extends StatefulWidget {
  const AuditPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AuditPageState createState() => _AuditPageState();
}

class _AuditPageState extends State<AuditPage> {
  List<Auditclass> _auditActions = []; 

  @override
  void initState() {
    super.initState();
    _loadAudits(); 
  }

  Future<void> _loadAudits() async {
    List<Auditclass> audits = await DatabaseHelper.Auditclasss();
    setState(() {
      _auditActions = audits; 
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<String> actions = Provider.of<AppData>(context).actions; 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoría'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _auditActions.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _auditActions[index].actionName, 
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


