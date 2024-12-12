import 'package:flutter/material.dart';
import 'package:info_med/maps.dart';
import 'package:info_med/medicamentos_screen.dart';
import 'package:info_med/models/usuario.dart';
import 'package:info_med/sintomas_screen.dart';
import 'package:info_med/perfil_screen.dart';

import 'data/usuario_inherited.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.usuarioLogado});

  final Usuario usuarioLogado;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indiceAtual = 0;
  late final List<Widget> _telas = [
    SintomasScreen(),
    MedicamentosScreen(),
    Maps(),
    PerfilScreen(),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Mover o login para o didChangeDependencies
    UsuarioInherited.of(context).logar(widget.usuarioLogado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.healing),
            label: 'Sintomas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Medicamentos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pharmacy),
            label: 'Farmácias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil', // Alterado de "Sobre" para "Perfil"
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
