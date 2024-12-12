import 'package:info_med/data/database.dart';
import 'package:sqflite/sqflite.dart';
import '../models/usuario.dart';

class UsuarioDao {
  static const String _nomeTabela = 'Usuario';

  static const String createTableUsuario = '''
    CREATE TABLE $_nomeTabela (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        Nome TEXT,
        Email TEXT UNIQUE,
        Senha TEXT,
        Alergias TEXT
    );
    ''';

  Future<int> createUsuario(Usuario usuario) async {
    final Database db = await getDatabase();
    return await db.insert('Usuario', usuario.toMap());
  }

  Future<Usuario?> getUsuario(String email, String senha) async {
    final Database db = await getDatabase();
    final maps = await db.query(
      'Usuario',
      columns: ['ID', 'Nome', 'Email', 'Senha', 'Alergias'],
      where: 'Email = ? and Senha = ?',
      whereArgs: [email, senha],
    );

    if (maps.isNotEmpty) {
      return Usuario.fromMap(maps.first);
    } else {
      return null;
    }
  }

  // Read - Obter todos os usuários
  Future<List<Usuario>> getAllUsuarios() async {
    final Database db = await getDatabase();
    final result = await db.query('Usuario');

    return result.map((map) => Usuario.fromMap(map)).toList();
  }

  // Update - Atualizar dados de um usuário
  Future<int> updateUsuario(Usuario usuario) async {
    final Database db = await getDatabase();
    return await db.update(
      'Usuario',
      usuario.toMap(),
      where: 'ID = ?',
      whereArgs: [usuario.id],
    );
  }

  // Delete - Remover um usuário por ID
  Future<int> deleteUsuario(int id) async {
    final Database db = await getDatabase();
    return await db.delete(
      'Usuario',
      where: 'ID = ?',
      whereArgs: [id],
    );
  }
}
