import 'package:flutter/material.dart';
import 'package:info_med/custom_appbar.dart';
import 'package:info_med/data/usuario_inherited.dart';
import 'package:info_med/edit_perfil_screen.dart';
import 'package:info_med/initial_screen.dart';
import 'package:info_med/models/usuario.dart';
import 'data/usuario_dao.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final UsuarioDao usuarioDao = UsuarioDao();

  @override
  Widget build(BuildContext context) {
    Usuario usuario = UsuarioInherited.of(context).usuarioLogado!;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        // Adicionando o SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto do usuário
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'assets/imagens/user.png'), // Caminho para a imagem do perfil
              backgroundColor: Colors.grey[300],
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                usuario.nome,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                usuario.email,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[700],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                usuario.alergias?.isNotEmpty == true ? usuario.alergias! : 'Sem alergias',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[700],
                ),
              ),
            ),

            Divider(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (newContext) => EditPerfilScreen(userContext: context,))).then((_) => setState(() {}));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Cor do botão
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Editar Perfil',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Apagar dados'),
                        content: Text('Tem certeza que deseja apagar seus dados?'),
                        actions: [
                          TextButton(
                            child: Text('Sim'),
                            onPressed: () {
                              UsuarioDao().deleteUsuario(usuario.id!);
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const Initialscreen()));
                            },
                          ),
                          TextButton(
                            child: Text('Não'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Cor do botão
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Apagar dados',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
