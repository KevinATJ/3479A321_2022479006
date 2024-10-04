import 'package:flutter/material.dart';
import 'package:flutter_lab1/pages/aboutpage.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Esta es la pantalla de detalles',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Botón 1 presionado')),
                );
              },
              child: const Text('Botón 1'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Botón 2 presionado')),
                );
              },
              child: const Text('Botón 2'),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: 'Volver',
              child: const Icon(Icons.arrow_back),
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
              tooltip: 'Ir a About',
              child: const Icon(Icons.info),
            ),
          ],
        ),
      ),
    );
  }

  
}

