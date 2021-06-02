import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
//import 'package:plan1/mobx/calculos/mob_calc.dart';
//import 'package:plan1/mobx/config/mob_config.dart';

//import 'package:plan1/screen/componentes/appbar.dart';
//import 'package:plan1/screen/configura/componentes/imputColum.dart';
import 'package:plant_1/mobx/calculos/mob_calc.dart';
import 'package:plant_1/mobx/config/mob_config.dart';
import 'package:plant_1/screen/componentes/appbar.dart';

import 'componentes/contSwitch.dart';
import 'componentes/imputConfig.dart';

class Configura extends StatefulWidget {
  final GlobalKey<ScaffoldState> cont;

  Configura({
    Key key,
    this.cont,
  }) : super(key: key);

  @override
  _ConfiguraState createState() => _ConfiguraState();
}

class _ConfiguraState extends State<Configura> {
  final Mob_Config _mob_config = GetIt.I<Mob_Config>();
  final Mob_Calc _mob_calc = GetIt.I<Mob_Calc>();
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    _mob_calc.inicializar();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCuston(
        titulo: 'Configuração',
        cont: widget.cont,
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.amber,
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black54,
                      thickness: 1,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        'Irrigação',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black54,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Quantidade de Tensiometros',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Observer(builder: (_) {
                return ContSwitch(
                  cont: _mob_config.qtd_tensiometro,
                  but_mais: () {
                    _mob_config.addTensiometro();
                  },
                  but_menos: () {
                    _mob_config.removeTensiometro();
                  },
                );
              }),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              ImputConfig(
                label: 'Vazão (L/h)',
                hint: 'Vazão',
                controle: (valor) {
                  _mob_config.setVazao(valor);
                },
                inicio: _mob_config.vazao,
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              ImputConfig(
                label: 'Tensão Critica (mca)',
                hint: 'Tensão Critica',
                controle: (valor) {
                  _mob_config.setTensao(valor);
                },
                inicio: _mob_config.tensao,
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              ImputConfig(
                label: 'Sistema Radicular (mm)',
                hint: 'Sistema Radicular',
                controle: (valor) {
                  _mob_config.setSistema_radicular(valor);
                },
                inicio: _mob_config.sistema_radicular,
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              ImputConfig(
                label: 'Capacidade de campo (RECT)',
                hint: 'Capacidade de campo',
                controle: (valor) {
                  _mob_config.setCapacidade_campo(valor);
                },
                inicio: _mob_config.capacidade_campo,
              ),
              SizedBox(
                height: 20,
              ),
              /*  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black54,
                      thickness: 1,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        'Dados da chuva',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black54,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Quantidade de Parcelas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Observer(builder: (_) {
                return ContSwitch(
                  cont: _mob_config.qtd_parcelas,
                  but_mais: () {
                    _mob_config.addParcela();
                  },
                  but_menos: () {
                    _mob_config.removeParcela();
                  },
                );
              }),
              SizedBox(
                height: 30,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),*/
              /*Text(
                'Quantidade de Colunas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Observer(builder: (_) {
                return ContSwitch(
                  cont: _mob_config.qtd_colunas,
                  but_mais: () {
                    _mob_config.addColuna();
                  },
                  but_menos: () {
                    _mob_config.removecoluna();
                  },
                );
              }),
              SizedBox(
                height: 20,
              ),
              Observer(builder: (_) {
                return Container(
                  height: _mob_config.qtd_colunas * 62 + 0.0,
                  child: Row(
                    children: [
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 2,
                        child: ListView.builder(
                          itemCount: _mob_config.qtd_colunas,
                          itemBuilder: (context, index) {
                            return ImputColum(
                              label: 'coluna ' + (index + 1).toString(),
                              index: index + 1,
                              inicio: _mob_config.colunas[index + 1],
                              controle: (valor) {
                                _mob_config.setColunas(index + 1, valor);
                              },
                            );
                          },
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Quantidade de linhas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Observer(builder: (_) {
                return ContSwitch(
                  cont: _mob_config.qtd_pontos_amostra,
                  but_mais: () {
                    _mob_config.addPontoAmostra();
                  },
                  but_menos: () {
                    _mob_config.removePontoAmostra();
                  },
                );
              }),
              SizedBox(
                height: 20,
              ),
              Observer(builder: (_) {
                return Container(
                  height: _mob_config.qtd_pontos_amostra * 62 + 0.0,
                  child: Row(
                    children: [
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                        flex: 2,
                        child: ListView.builder(
                          itemCount: _mob_config.qtd_pontos_amostra,
                          itemBuilder: (context, index) {
                            print('as ${_mob_config.qtd_pontos_amostra}');
                            return ImputColum(
                              label: 'linha' + (index + 1).toString(),
                              index: index + 1,
                              inicio: _mob_config.amostras[index],
                              controle: (valor) {
                                _mob_config.setLinhas(index, valor);
                              },
                            );
                          },
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                );
              }),*/
            ],
          ),
        ),
      ),
    );
  }
}
