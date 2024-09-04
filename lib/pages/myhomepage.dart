import 'package:flutter/material.dart';
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

  BottomAppBar _bottomButtons() {
    return BottomAppBar(
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    secondlogger.d('Second logger MyHomePage is working!');

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blue,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Pulsaste este boton muchas veces:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SvgPicture.asset(
              iconPath,
              width: 100,
              height: 100,
            )
          ],
        ),
      ),
      bottomNavigationBar: _bottomButtons(),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.pink,
            brightness: Brightness.dark,
          ),
        ),
        child: FloatingActionButton(
          onPressed: _resetCounter,
          child: const Icon(Icons.refresh),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}