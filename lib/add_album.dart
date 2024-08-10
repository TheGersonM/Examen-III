import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddAlbum extends StatelessWidget {
  AddAlbum({super.key});

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController bandaController = TextEditingController();
  final TextEditingController anioController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Album'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre del album',
              ),
            ),
            TextField(
              controller: bandaController,
              decoration: const InputDecoration(
                labelText: 'Nombre de la banda',
              ),
            ),
            TextField(
              controller: anioController,
              decoration: const InputDecoration(
                labelText: 'Anio de lanzamiento',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final album = {
                  'nombre_album': nombreController.text,
                  'nombre_banda': bandaController.text,
                  'anio_lanzamiento': double.parse(anioController.text),
                  'votos': 0,
                };
        
                //guardar en firebase
                final albumRef =
                    FirebaseFirestore.instance.collection('GM_Albums');
        
                albumRef.add(album);
                Navigator.pop(context);
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}