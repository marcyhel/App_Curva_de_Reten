import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
//import 'package:plan1/mobx/calculos/mob_calc.dart';
//import 'package:plan1/mobx/config/mob_config.dart';
//import 'package:plan1/screen/baseDados/componentes/imputBaseDados.dart';
//import 'package:plan1/screen/baseDados/componentes/text.dart';
//import 'package:plan1/screen/componentes/appbar.dart';
//import 'package:plan1/screen/curvaRetencao/componentes/imputRetencao.dart';
import 'package:plant_1/mobx/calculos/mob_calc.dart';
import 'package:plant_1/mobx/config/mob_config.dart';
import 'package:plant_1/screen/baseDados/componentes/text.dart';
import 'package:plant_1/screen/componentes/appbar.dart';

import 'componentes/imputRetencao.dart';

final Mob_Config _mob_config = GetIt.I<Mob_Config>();
final Mob_Calc _mob_calc = GetIt.I<Mob_Calc>();

class CurvaRetencao extends StatefulWidget {
  final GlobalKey<ScaffoldState> cont;
  CurvaRetencao({
    Key key,
    this.cont,
  }) : super(key: key);
  @override
  _CurvaRetencaoState createState() => _CurvaRetencaoState(cont);
}

class _CurvaRetencaoState extends State<CurvaRetencao> {
  GlobalKey<ScaffoldState> cont;
  _CurvaRetencaoState(this.cont);
  @override
  void dispose() {
    _mob_calc.inicializar();
    super.dispose();
  }

  int conta = 0;
  int index = 0;
  int indeCo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCuston(
        titulo: 'Curva de Retenção',
        cont: cont,
      ),
      body:  SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height/1.15,
          decoration: BoxDecoration(
            color:Colors.blueGrey[100].withAlpha(100),
            borderRadius: BorderRadius.circular(5)
          ),
          margin: EdgeInsets.all(10),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
              ImputCurvaRetencao(indexx:0,indexy: 0,titulo: "Teta R",label: "Teta R",),
              ImputCurvaRetencao(indexx:0,indexy: 1,titulo: "Teta S",label: "Teta S"),
              ImputCurvaRetencao(indexx:0,indexy: 2,titulo: "Alfa",label: "Alfa",),
              ImputCurvaRetencao(indexx:0,indexy: 3,titulo: "n",label: "n",),
              ],
            ),
          ),
      ),
      
    );
  }
}
