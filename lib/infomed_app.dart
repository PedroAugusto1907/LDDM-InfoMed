import 'package:flutter/material.dart';

class InfomedApp extends StatelessWidget {
  const InfomedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sobre', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ // Espaço entre o AppBar e o conteúdo
          Center(
            child: Image.asset(
              'assets/imagens/logo.png',
              height: 220, // Tamanho da logo
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Bem-vindo ao Infomed!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Cor azul padrão do app
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10), // Espaço entre a logo e o slogan
          Text(
            'Seu guia de saúde inteligente.',
            style: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic, // Itálico
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),

          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'O Infomed é um aplicativo desenvolvido para fornecer informações rápidas e precisas sobre medicamentos. '
                  'Nosso objetivo é ajudar você a encontrar as melhores opções para sintomas e entender os componentes, '
                  'indicações e dosagens de cada medicamento. Com o Infomed, você pode acessar as informações de maneira '
                  'fácil e eficiente, sempre ao alcance das suas mãos!',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87, // Cor mais suave para o texto
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 40), // Espaçamento inferior
        ],
      ),
    );
  }
}