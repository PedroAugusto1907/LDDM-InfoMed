class Usuario {
  final int? id;
  final String nome;
  final String email;
  final String senha;
  final String? alergias;

  Usuario({
    this.id,
    required this.nome,
    required this.email,
    required this.senha,
    this.alergias,
  });

  // Converte um Map (do SQLite) em um objeto Usuario
  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['ID'],
      nome: map['Nome'],
      email: map['Email'],
      senha: map['Senha'],
      alergias: map['Alergias'],
    );
  }

  // Converte o objeto Usuario em um Map (para salvar no SQLite)
  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'Nome': nome,
      'Email': email,
      'Senha': senha,
      'Alergias': alergias,
    };
  }
}
