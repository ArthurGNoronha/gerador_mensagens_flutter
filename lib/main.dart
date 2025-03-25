import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCjA5li31gUdQR7XXxqbSHhWf2_C1r1df4",
      authDomain: "mensagensmotivacionaisflutter.firebaseapp.com",
      projectId: "mensagensmotivacionaisflutter",
      storageBucket: "mensagensmotivacionaisflutter.firebasestorage.app",
      messagingSenderId: "410698936191",
      appId: "1:410698936191:web:a666569a9598b28dbef44a",
      databaseURL: "https://mensagensmotivacionaisflutter-default-rtdb.firebaseio.com",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerador de Mensagens',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}