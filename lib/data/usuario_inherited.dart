import 'package:flutter/material.dart';
import 'package:info_med/models/usuario.dart';

class UsuarioInherited extends InheritedWidget {
  UsuarioInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  Usuario? usuarioLogado;

  void logar(Usuario usuario){
    usuarioLogado = usuario;
  }

  static UsuarioInherited of(BuildContext context) {
    final UsuarioInherited? result =
    context.dependOnInheritedWidgetOfExactType<UsuarioInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(UsuarioInherited oldWidget) {
    return oldWidget.usuarioLogado != usuarioLogado;
  }
}
