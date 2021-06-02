import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:mobx/mobx.dart';
//import 'package:plan1/drawer/custonDrawer.dart';
//import 'package:plan1/mobx/drawer/mob_drawer.dart';
//import 'package:plan1/screen/baseDados/baseDados.dart';
//import 'package:plan1/screen/configura/configura.dart';
//import 'package:plan1/screen/curvaRetencao/curvaRetencao.dart';
//import 'package:plan1/screen/dados/dados.dart';
//import 'package:plan1/screen/status/status.dart';
//import 'package:plan1/screen/tutorial/slider.dart';
import 'package:plant_1/drawer/custonDrawer.dart';
import 'package:plant_1/mobx/drawer/mob_drawer.dart';
import 'package:plant_1/screen/status/status.dart';

import 'configura/configura.dart';
import 'curvaRetencao/curvaRetencao.dart';
import 'dados/dados.dart';
import 'tutorial/slider.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class _PrincipalState extends State<Principal> {
  final Mob_Drawer mob = GetIt.I<Mob_Drawer>();
  PageController _controle = PageController(initialPage: 0);
  Box _caixa;
  @override
  void initState() {
    inicia();
    //_controle.jumpToPage(0);
    //autorun((fn) => print(mob.data));
    reaction<int>(
      (fn) => mob.data,
      (valor) => _controle.jumpToPage(valor), //_controle.animateToPage(valor,
      // duration: Duration(milliseconds: 500), curve: Curves.easeOut),
    );
    super.initState();
  }

  Future<void> inicia() async {
    Box box = await Hive.openBox('minhaCaixa');
    await Future.delayed(Duration(microseconds: 0));
    if (await box.get('tuto') == null) {
      await box.put('tuto', '0');
      mob.data = 4;
    } else {
      mob.data = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: CustonDrawer(),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controle,
        children: [
          Status(cont: _drawerKey),
          Dados(cont: _drawerKey),

          //BaseDados(cont: _drawerKey),
          CurvaRetencao(cont: _drawerKey),
          Configura(cont: _drawerKey),
          SlideCuston(cont: _drawerKey),
        ],
      ),
    );
  }
}
