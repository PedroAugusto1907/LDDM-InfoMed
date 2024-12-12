import 'package:flutter/material.dart';
import 'package:info_med/infomed_app.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.implyLeading = false});

  final bool implyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InfomedApp(), // Tela "Sobre o App"
            ),
          );
        },
        child: Image.asset(
          'assets/imagens/logo.png',
          height: 120,
          //fit: BoxFit.contain,
        ),
      ),
      backgroundColor: Colors.blue,
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: implyLeading
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
