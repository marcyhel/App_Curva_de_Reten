import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
//import 'package:plan1/mobx/calculos/mob_calc.dart';
//import 'package:plan1/mobx/config/mob_config.dart';
//import 'package:plan1/screen/status/componentes/rowTable.dart';
import 'package:plant_1/mobx/calculos/mob_calc.dart';
import 'package:plant_1/mobx/config/mob_config.dart';
import 'package:plant_1/screen/status/componentes/rowTable.dart';

final Mob_Calc _mob_calc = GetIt.I<Mob_Calc>();
final Mob_Config _mob_config = GetIt.I<Mob_Config>();

class Tabela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Profundidade",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Leitura (kPa)",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Leitura (mca)",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Irriga",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Umidade Atual",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Lâmina",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Tempo (h)",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          VerticalDivider(
            thickness: 1,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _mob_config.qtd_tensiometro,
              itemBuilder: (contex, index) {
                return RowTable(
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
