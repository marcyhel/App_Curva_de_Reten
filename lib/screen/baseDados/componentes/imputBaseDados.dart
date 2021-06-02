import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
//import 'package:plan1/mobx/config/mob_config.dart';
import 'package:flutter_masked_text/flutter_masked_text.Dart';
import 'package:plant_1/mobx/config/mob_config.dart';
class ImputBaseDados extends StatelessWidget {
  final Mob_Config _mob_config = GetIt.I<Mob_Config>();
  final int indexx;
  final int indexy;
  final Function controle;
  final String inicio;
  ImputBaseDados({
    Key key,
    this.indexx,
    this.indexy,
    this.controle,
    this.inicio,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _contro = TextEditingController(
        text: _mob_config.dados[indexx][indexy].toString());
    return Observer(builder: (_) {
      return TextField(
        textAlign: TextAlign.end,
        controller: _contro,
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.black54),
        decoration: InputDecoration(
          isDense: true,

          //labelText: 'label',
          //hintText: 'hint',
        ),
        onChanged: (valor) {
          _mob_config.setDados(indexx, indexy, valor);
        },
      );
    });
  }
}
