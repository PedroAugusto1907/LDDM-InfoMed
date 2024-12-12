import 'package:info_med/data/usuario_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'usuario.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(UsuarioDao.createTableUsuario);
  }, version: 1);
}


