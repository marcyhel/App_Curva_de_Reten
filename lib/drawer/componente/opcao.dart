import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

//import 'package:plan1/drawer/componente/itens.dart';
//import 'package:plan1/mobx/drawer/mob_drawer.dart';
import 'package:plant_1/drawer/componente/itens.dart';
import 'package:plant_1/mobx/drawer/mob_drawer.dart';

class Opcao extends StatelessWidget {
  final Mob_Drawer mob = GetIt.I<Mob_Drawer>();
  BuildContext cont;
  Opcao({
    Key key,
    this.cont,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Observer(builder: (_) {
          return Itensdrawer(
            titulo: 'Status',
            icone: Icon(Icons.stacked_bar_chart),
            index: 0,
            selecionado: (mob.data == 0) ? true : false,
          );
        }),
        Observer(builder: (_) {
          return Itensdrawer(
            titulo: 'Tensiometros',
            icone: Icon(Icons.stacked_line_chart_rounded),
            index: 1,
            selecionado: (mob.data == 1) ? true : false,
          );
        }),
        Observer(builder: (_) {
          return Itensdrawer(
            titulo: 'Curva de retenção',
            icone: Icon(Icons.insert_chart_outlined_rounded),
            index: 2,
            selecionado: (mob.data == 2) ? true : false,
          );
        }),
        Observer(builder: (_) {
          return Itensdrawer(
            titulo: 'Configuração',
            icone: Icon(Icons.settings_rounded),
            index: 3,
            selecionado: (mob.data == 3) ? true : false,
          );
        }),
        Observer(builder: (_) {
          return Itensdrawer(
            titulo: 'Ajuda',
            icone: Icon(Icons.help_outline_rounded),
            index: 4,
            selecionado: (mob.data == 4) ? true : false,
          );
        }),
        /*Observer(builder: (_) {
          return Itensdrawer(
            titulo: 'Base de Dados',
            icone: Icon(Icons.import_export_rounded),
            index: 3,
            selecionado: (mob.data == 3) ? true : false,
          );
        }),*/
      ],
    );
  }
}
