import 'package:flutter/material.dart';
import 'package:flutter_lab1/appdata.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
     Provider.of<AppData>(context, listen: false).actions.add('Ingreso a la pantalla about');

    return Scaffold(
      appBar: AppBar(
        title: const Text('About me'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Esta es la pantalla sobre mí.\n\n\nMis género favorito de juegos es el terror\n\nMi juego favorito es bloodborne\n\nNormalmente juego juegos online tipo lol, dbd, valorant, etc. ',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Esta es la página about de Kevin Troncoso')),
                );
              },
              child: const Text('Botón Sobre'),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Volver',
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

