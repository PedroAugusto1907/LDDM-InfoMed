import 'package:flutter/material.dart';
import 'package:info_med/custom_appbar.dart'; // Importe o CustomAppBar

import 'info_sintomas_screen.dart';

class SintomasScreen extends StatefulWidget {
  const SintomasScreen({super.key});

  @override
  State<SintomasScreen> createState() => _SintomasScreenState();
}

class _SintomasScreenState extends State<SintomasScreen> {
  final List<Map<String, String>> _sintomas = [
    {
      'nome': 'Febre',
      'descricao': 'Aumento temporário da temperatura corporal.',
    },
    {
      'nome': 'Tosse',
      'descricao': 'Resposta reflexa para limpar as vias respiratórias.',
    },
    {
      'nome': 'Dor de cabeça',
      'descricao': 'Desconforto na região da cabeça.',
    },
    {
      'nome': 'Dor abdominal',
      'descricao': 'Desconforto na região do abdômen.',
    },
    {
      'nome': 'Fadiga',
      'descricao': 'Sensação de cansaço extremo e falta de energia.',
    },
    {
      'nome': 'Dor de garganta',
      'descricao': 'Irritação ou desconforto na garganta.',
    },
    {
      'nome': 'Náusea',
      'descricao': 'Sensação de enjoo e desejo de vomitar.',
    },
    {
      'nome': 'Vômito',
      'descricao': 'Ato de expelir conteúdo do estômago pela boca.',
    },
    {
      'nome': 'Diarréia',
      'descricao': 'Evacuações frequentes e líquidas.',
    },
    {
      'nome': 'Congestão nasal',
      'descricao': 'Obstrução nasal, dificultando a respiração pelo nariz.',
    },
    {
      'nome': 'Dificuldade para respirar',
      'descricao': 'Sensação de falta de ar ou respiração superficial.',
    },
    {
      'nome': 'Calafrios',
      'descricao': 'Sensação de frio com tremores involuntários.',
    },
    {
      'nome': 'Erupção cutânea',
      'descricao': 'Aparecimento de manchas ou lesões na pele.',
    },
    {
      'nome': 'Dor muscular',
      'descricao': 'Desconforto ou dor nos músculos.',
    },
    {
      'nome': 'Tontura',
      'descricao': 'Sensação de desmaio ou desequilíbrio.',
    },
  ];

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> _filteredSintomas = _sintomas
        .where((sintoma) =>
        sintoma['nome']!.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar Sintoma',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredSintomas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredSintomas[index]['nome']!),
                  subtitle: Text(_filteredSintomas[index]['descricao']!),
                  leading: const Icon(Icons.local_hospital, color: Color(0xFF009688), size: 40),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoSintomasScreen(
                          nome: _filteredSintomas[index]['nome']!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}