import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
//import 'package:plan1/mobx/config/mob_config.dart';
import 'dart:math';

import 'package:plant_1/mobx/config/mob_config.dart';
part 'mob_calc.g.dart';

class Mob_Calc = _Mob_Calc with _$Mob_Calc;
final Mob_Config _mob_config = GetIt.I<Mob_Config>();

abstract class _Mob_Calc with Store {
  _Mob_Calc() {
    print('calcula');
    inicializar();
  }
  Future<void> inicializar() async {
    await Future.delayed(Duration(microseconds: 0));
    try {
      iniciaColumM();

      iniciaLeituraMCA();
      iniciaIrriga();
      iniciaUmidadeTual();
      iniciaLamina();
      iniciaTempo();
      mensagemErro = false;
    } catch (e) {
      print('falta alguns dados');
      mensagemErro = true;
    }
  }

  void iniciaColumM() {
    print(_mob_config.curvaRetencao);
    columM = [];
    for (int i = 0; i < _mob_config.qtd_parcelas; i++) {
      columM.add(1 - (1 / double.parse(_mob_config.curvaRetencao[i][3])));
    }
    print(columM);
  }

  void iniciaLeituraMCA() {
    listaMCA = [];
    for (int i = 0; i < _mob_config.qtd_tensiometro; i++) {
      listaMCA.add(double.parse(_mob_config.sensores[i][1]) / 10);
    }
    print(listaMCA);
  }

  void iniciaIrriga() {
    print(_mob_config.tensao);
    irriga = [];
    for (int i = 0; i < _mob_config.qtd_tensiometro; i++) {
      if (listaMCA[i] >= double.parse(_mob_config.tensao)) {
        irriga.add(true);
      } else {
        irriga.add(false);
      }
    }
    print(irriga);
  }

  void iniciaUmidadeTual() {
    umidadeAtual = [];
    double tetaR = double.parse(_mob_config.curvaRetencao[0][0]);
    double tetaS = double.parse(_mob_config.curvaRetencao[0][1]);
    double alfa = double.parse(_mob_config.curvaRetencao[0][2]);
    double n = double.parse(_mob_config.curvaRetencao[0][3]);
    for (int i = 0; i < _mob_config.qtd_tensiometro; i++) {
      umidadeAtual.add(tetaR +
          ((tetaS - tetaR) /
              (pow(1 + (pow(alfa * listaMCA[i], n)), columM[0]))));
    }
    print(umidadeAtual);
  }

  void iniciaLamina() {
    lamina = [];

    for (int i = 0; i < _mob_config.qtd_tensiometro; i++) {
      lamina.add(
          (double.parse(_mob_config.capacidade_campo) - umidadeAtual[i]) *
              double.parse(_mob_config.sistema_radicular));
    }
    print(lamina);
  }

  void iniciaTempo() {
    tempo = [];

    for (int i = 0; i < _mob_config.qtd_tensiometro; i++) {
      tempo.add((lamina[i] / double.parse(_mob_config.vazao)));
    }
    print(tempo);
  }

  @observable
  int data = 0;
  @observable
  List<double> columM = [];
  @observable
  List<double> listaMCA = [];
  @observable
  List<bool> irriga = [];
  @observable
  List<double> umidadeAtual = [];
  @observable
  List<double> lamina = [];
  @observable
  List<double> tempo = [];
  @observable
  bool mensagemErro = true;
  @action
  void setData(int valor) => data = valor;
}
