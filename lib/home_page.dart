import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
  

    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Votaciones Album del Año', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,

      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('GM_Albums').snapshots(),  
        builder: (BuildContext conext,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasError){
            return const Center(
              child: Text('Error al cargar los datos'),
            );
          }
          final data = snapshot.requireData;

          final albums = data.docs;

          return ListView.builder(
            itemCount: albums.length,
            itemBuilder: (context, index) {
              final album = albums[index].data();
              return ListTile(
                leading: IconButton(icon: const  Icon(Icons.add),
                onPressed: ()  async {
                  //Suma1 1 voto
                  final albumRef = FirebaseFirestore.instance.collection('GM_Albums').doc(albums[index].id);
                  await albumRef.update({'votos': FieldValue.increment(1)});


                }),
                
                title: Text(album['nombre_album']),
                subtitle: Text(album['nombre_banda']),
                trailing: Text(album['votos'].toString(), style: const TextStyle(fontSize: 20),),

              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/album');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
