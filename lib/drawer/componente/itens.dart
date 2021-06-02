import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
//import 'package:plan1/mobx/drawer/mob_drawer.dart';
import 'package:plant_1/mobx/drawer/mob_drawer.dart';

class Itensdrawer extends StatelessWidget {
  final Mob_Drawer mob = GetIt.I<Mob_Drawer>();

  final String titulo;
  final Icon icone;
  final int index;
  final selecionado;
  Itensdrawer({
    Key key,
    this.titulo,
    this.icone,
    this.index,
    this.selecionado = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: (selecionado)
              ? Text(
                  titulo,
                  style: TextStyle(color: Theme.of(context).accentColor),
                )
              : Text(titulo),
          leading: (selecionado)
              ? Icon(
                  icone.icon,
                  color: Theme.of(context).accentColor,
                )
              : Icon(icone.icon),
          onTap: () {
            Navigator.pop(context);

            print('object');
            mob.setData(index);
          },
        ),
      ],
    );
  }
}
