import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
//import 'package:plan1/mobx/calculos/mob_calc.dart';
//import 'package:plan1/mobx/config/mob_config.dart';
//
//import 'package:plan1/screen/componentes/appbar.dart';
//import 'package:plan1/screen/dados/componentes/imput_profund.dart';
import 'package:plant_1/mobx/calculos/mob_calc.dart';
import 'package:plant_1/mobx/config/mob_config.dart';
import 'package:plant_1/screen/componentes/appbar.dart';

import 'componentes/imput_profund.dart';

final Mob_Calc _mob_calc = GetIt.I<Mob_Calc>();
final Mob_Config _mob_config = GetIt.I<Mob_Config>();

class Dados extends StatefulWidget {
  final GlobalKey<ScaffoldState> cont;
  Dados({
    Key key,
    this.cont,
  }) : super(key: key);

  @override
  _DadosState createState() => _DadosState();
}

class _DadosState extends State<Dados> {
  void dispose() {
    print('olaaaaa');
    _mob_calc.inicializar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: CustonDrawer(),
      appBar: AppBarCuston(
        titulo: "Tensiometros",
        cont: widget.cont,
      ),
      body: Container(
        decoration: BoxDecoration(
          color:Colors.blueGrey[100].withAlpha(100),
          borderRadius: BorderRadius.circular(5)
        ),
        
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(10),
        child: Observer(builder: (_) {
          return ListView.builder(
            itemCount: _mob_config.qtd_tensiometro,
            itemBuilder: (BuildContext context, int index) {
              return ImputProfund(numSensor: index);
            },
          );
        }),
      ),
    );
  }
}
