class UserDados {
  late String _nome;
  late String _faixaEtaria;
  late String _interesses;
  late bool _movies;

  set setNome(String nome) {
    this._nome = nome;
  }

  String get getNome {
    return this._nome;
  }

  bool get movies => _movies;

  set movies(bool value) {
    _movies = value;
  }

  String get interesses => _interesses;

  set interesses(String value) {
    _interesses = value;
  }

  String get faixaEtaria => _faixaEtaria;

  set faixaEtaria(String value) {
    _faixaEtaria = value;
  }

  @override
  static UserDados userDadosInstance = UserDados();
}
