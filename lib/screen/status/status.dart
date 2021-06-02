import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
//import 'package:plan1/mobx/calculos/mob_calc.dart';
//
//import 'package:plan1/screen/componentes/appbar.dart';
//import 'package:plan1/screen/status/componentes/tabela.dart';
import 'package:plant_1/mobx/calculos/mob_calc.dart';

import '../componentes/appbar.dart';
import 'componentes/mensagemErro.dart';
import 'componentes/tabela.dart';

class Status extends StatefulWidget {
  final GlobalKey<ScaffoldState> cont;
  const Status({
    Key key,
    this.cont,
  }) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  final Mob_Calc _mob_calc = GetIt.I<Mob_Calc>();
  Box box;
  TextEditingController _contro;
  String tex = 'f';

  @override
  void initState() {
    setState(() {});
    asyncMethod();
    _mob_calc.inicializar();
    // box.get('text');
    super.initState();
  }

  void asyncMethod() async {
    box = await Hive.openBox('minhaCaixa');
    if (box.get('text') == null) {
      box.put('text', '');
    }

    _contro = TextEditingController(text: box.get('text'));
    tex = await box.get('text');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  drawer: CustonDrawer(),
      appBar: AppBarCuston(
        titulo: 'Status',
        cont: widget.cont,
      ),
      body: Observer(builder: (_) {
        return Container(
          child: (_mob_calc.mensagemErro)
              ? Center(child: MensagemErro())
              : Tabela(),
        );
      }),
    );
  }
}
