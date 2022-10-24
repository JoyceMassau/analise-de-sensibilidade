List colunaNomesVariaveis = [];
main() {
  final List _resultadoSimplex = [
    [
      ['Base', 'x1', 'x2', 'x3', 's1', 's2', 's3', 'b'],
      ['x2', 0, 1, 0.83, 1.66, -0.16, 0, 66.66],
      ['x1', 1, 0, 0.16, -0.66, 0.16, 0, 33.33],
      ['s3', 0, 0, 4, -2, 0, 1, 100],
      ['z', 0, 0, 2.66, 3.33, 0.66, 0, 733.33],
    ]
  ];

  Map<dynamic, dynamic> _colunas = _valoresColunas(_resultadoSimplex);

  // FALTA PASSO INTERMEDIÁRIO: Verificar se variável é básica ou de folga, para ter apenas x1,x2,s1 e s2

  _colunaVf(_colunas);
}

Map<dynamic, dynamic> _valoresColunas(List tabelaSimplex) {
  int _qntLinhas = tabelaSimplex.first.length;
  int _qntColunas = tabelaSimplex.first[0].length;
  Map<dynamic, dynamic> _colunas = {};

  for (var i = 0; i < _qntLinhas; i++) {
    for (var j = 0; j < _qntColunas; j++) {
      if (i == 0) {
        // Popula chaves do Map com títulos das colunas
        colunaNomesVariaveis.add(tabelaSimplex.first[i][j]);
        //[x1, x2, x3, s1, s2, b]
        _colunas[colunaNomesVariaveis[j]] = [];
      } else {
        _colunas[_keyReferenteIndiceDoMap(_colunas, j)].add(
          tabelaSimplex.first[i][j],
        );
      }
    }
  }

  return _colunas;
}

_keyReferenteIndiceDoMap(Map<dynamic, dynamic> valor, int index) {
  return valor.keys.toList()[index];
}

_colunaVf(Map<dynamic, dynamic> tabela) {
  int _qntLinhas = _keyReferenteIndiceDoMap(tabela, 0).length;
  int _qntColunas = tabela.keys.toList().length;
  Map<dynamic, dynamic> _colunas = {};

  for (var i = 1; i < _qntLinhas; i++) {
    for (var j = 0; j < _qntColunas; j++) {
      if (i == 0) {
        _colunas[_keyReferenteIndiceDoMap(tabela, j)] = 0;
      } else {
        print(tabela['b']);
        // _colunas[_keyReferenteIndiceDoMap(tabela, j)] = tabela['b'][i];
      }
    }
  }

  print('titulos colunas $_colunas');
}
