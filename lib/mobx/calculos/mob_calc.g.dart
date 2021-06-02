// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mob_calc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Mob_Calc on _Mob_Calc, Store {
  final _$dataAtom = Atom(name: '_Mob_Calc.data');

  @override
  int get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(int value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$columMAtom = Atom(name: '_Mob_Calc.columM');

  @override
  List<double> get columM {
    _$columMAtom.reportRead();
    return super.columM;
  }

  @override
  set columM(List<double> value) {
    _$columMAtom.reportWrite(value, super.columM, () {
      super.columM = value;
    });
  }

  final _$listaMCAAtom = Atom(name: '_Mob_Calc.listaMCA');

  @override
  List<double> get listaMCA {
    _$listaMCAAtom.reportRead();
    return super.listaMCA;
  }

  @override
  set listaMCA(List<double> value) {
    _$listaMCAAtom.reportWrite(value, super.listaMCA, () {
      super.listaMCA = value;
    });
  }

  final _$irrigaAtom = Atom(name: '_Mob_Calc.irriga');

  @override
  List<bool> get irriga {
    _$irrigaAtom.reportRead();
    return super.irriga;
  }

  @override
  set irriga(List<bool> value) {
    _$irrigaAtom.reportWrite(value, super.irriga, () {
      super.irriga = value;
    });
  }

  final _$umidadeAtualAtom = Atom(name: '_Mob_Calc.umidadeAtual');

  @override
  List<double> get umidadeAtual {
    _$umidadeAtualAtom.reportRead();
    return super.umidadeAtual;
  }

  @override
  set umidadeAtual(List<double> value) {
    _$umidadeAtualAtom.reportWrite(value, super.umidadeAtual, () {
      super.umidadeAtual = value;
    });
  }

  final _$laminaAtom = Atom(name: '_Mob_Calc.lamina');

  @override
  List<double> get lamina {
    _$laminaAtom.reportRead();
    return super.lamina;
  }

  @override
  set lamina(List<double> value) {
    _$laminaAtom.reportWrite(value, super.lamina, () {
      super.lamina = value;
    });
  }

  final _$tempoAtom = Atom(name: '_Mob_Calc.tempo');

  @override
  List<double> get tempo {
    _$tempoAtom.reportRead();
    return super.tempo;
  }

  @override
  set tempo(List<double> value) {
    _$tempoAtom.reportWrite(value, super.tempo, () {
      super.tempo = value;
    });
  }

  final _$mensagemErroAtom = Atom(name: '_Mob_Calc.mensagemErro');

  @override
  bool get mensagemErro {
    _$mensagemErroAtom.reportRead();
    return super.mensagemErro;
  }

  @override
  set mensagemErro(bool value) {
    _$mensagemErroAtom.reportWrite(value, super.mensagemErro, () {
      super.mensagemErro = value;
    });
  }

  final _$_Mob_CalcActionController = ActionController(name: '_Mob_Calc');

  @override
  void setData(int valor) {
    final _$actionInfo =
        _$_Mob_CalcActionController.startAction(name: '_Mob_Calc.setData');
    try {
      return super.setData(valor);
    } finally {
      _$_Mob_CalcActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
columM: ${columM},
listaMCA: ${listaMCA},
irriga: ${irriga},
umidadeAtual: ${umidadeAtual},
lamina: ${lamina},
tempo: ${tempo},
mensagemErro: ${mensagemErro}
    ''';
  }
}
