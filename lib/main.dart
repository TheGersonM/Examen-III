import 'package:examen3/add_album.dart';
import 'package:examen3/firebase_options.dart';
import 'package:examen3/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

  class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/album': (context) =>  AddAlbum(), 
      },
    );
  }

  
}