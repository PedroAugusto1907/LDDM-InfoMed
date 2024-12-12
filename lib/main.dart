import 'package:flutter/material.dart';
import 'package:info_med/initial_screen.dart';
import 'package:info_med/login_screen.dart';
import 'cadastro_screen.dart'; // Importa o arquivo com a tela de cadastro
import 'package:info_med/medicamentos_screen.dart';
import 'package:info_med/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de Cadastro',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const Initialscreen(), // Define a tela de cadastro como inicial
    );
  }
}
