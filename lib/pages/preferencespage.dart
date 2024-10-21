import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferencespage extends StatefulWidget {
  const Preferencespage({super.key});
  @override
  PreferencesPageState createState() => PreferencesPageState();
}

class PreferencesPageState extends State<Preferencespage> {
  String _userName = '';
  int _counter = 0;

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? '';
      _counter = prefs.getInt('counter') ?? 0;
      print('Counter value $_counter is loaded');
      print('Username value $_userName is loaded');
    });
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', _userName);
    await prefs.setInt('counter', _counter);
    print('Preferences saved: $_userName, $_counter');
  }

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  void _updateUserName(String newName) {
    setState(() {
      _userName = newName;
    });
    _savePreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferencias'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Username: $_userName'),
            TextFormField(
              initialValue: _userName, 
              onChanged: _updateUserName, 
            ),
            const SizedBox(height: 20),
            Text('Counter: $_counter'),
            Slider(
              value: _counter.toDouble(),
              min: 0,
              max: 100,
              divisions: 100,
              onChanged: (double newValue) {
                setState(() {
                  _counter = newValue.toInt(); 
                });
                _savePreferences(); 
              },
            ),
          ],
        ),
      ),
    );
  }
}
