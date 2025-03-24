import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final database = FirebaseDatabase.instance.ref();
  String mensagem = "Clique para gerar uma mensagem!";

  Future<void> buscarMensagem() async {
    final snapshot = await database.child('mensagens').get();
    if (snapshot.exists) {
      final mensagens = Map<String, dynamic>.from(snapshot.value as dynamic);
      final randomKey = mensagens.keys.elementAt(Random().nextInt(mensagens.length));
      setState(() {
        mensagem = mensagens[randomKey];
      });
    } else {
      setState(() {
        mensagem = "Nenhuma mensagem encontrada.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gerador de Mensagens")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                mensagem,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: buscarMensagem,
                child: const Text("Nova Mensagem"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}