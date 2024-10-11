import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  int _counter = 0;
  final List<String> actions = [];

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    addActions('Counter incrementado');
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    addActions('Counter disminuido');
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    addActions('Counter reseteado');
    notifyListeners();
  }

  void addActions(String action){
    actions.add(action);
    notifyListeners();
  }
}