import 'package:flutter/material.dart';
import 'package:flutter_lab1/pages/detailpage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Logger secondlogger = Logger();

  String iconPath = 'assets/icons/Hamburguesa.svg';
  String iconPathVictory = 'assets/icons/Win.svg';
  String iconPathDefeat = 'assets/icons/Defeat.svg';
  String iconPathReset = 'assets/icons/Restart.svg';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    secondlogger.d('Second logger MyHomePage is working!');

    String gameIcon;
    String message;
    if (_counter == 10) {
      gameIcon = iconPathVictory;
      message = '¡Victoria!';
    } else if (_counter == 5) {
      gameIcon = iconPathDefeat;
      message = 'Derrota';
    } else {
      gameIcon = iconPathReset;
      message = 'Sigue jugando...';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: 1200,  
          height: 600, 
          child: Card(
            margin: const EdgeInsets.all(16.0),
            elevation: 8,
            child: Column(
              mainAxisSize: MainAxisSize.max, 
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SvgPicture.asset(
                        gameIcon,
                        width: 50,
                        height: 50,
                      ),
                      
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        message,
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        color: Colors.red,
                        icon: const Icon(Icons.exposure_minus_1),
                        onPressed: _decrementCounter,
                        tooltip: 'Disminuir',
                      ),
                      IconButton(
                        color: Colors.green,
                        icon: const Icon(Icons.plus_one),
                        onPressed: _incrementCounter,
                        tooltip: 'Incrementar',
                      ),
                      IconButton(
                        color: Colors.blue,
                        icon: const Icon(Icons.refresh),
                        onPressed: _resetCounter,
                        tooltip: 'Resetear',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DetailPage()),
          );
        },
        tooltip: 'Ir a Detalle',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

