import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

//import 'package:plan1/mobx/calculos/mob_calc.dart';
//import 'package:plan1/mobx/config/mob_config.dart';
import 'package:plant_1/mobx/calculos/mob_calc.dart';
import 'package:plant_1/mobx/config/mob_config.dart';

final Mob_Calc _mob_calc = GetIt.I<Mob_Calc>();
final Mob_Config _mob_config = GetIt.I<Mob_Config>();

class RowTable extends StatelessWidget {
  int index;
  RowTable({
    Key key,
    this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(_mob_config.sensores[index][0]),
              Text(_mob_config.sensores[index][1]),
              Text(_mob_calc.listaMCA[index].toStringAsPrecision(2)),
              (_mob_calc.irriga[index])
                  ? Icon(
                      Icons.done_rounded,
                      color: Colors.green,
                    )
                  : Icon(
                      Icons.close_rounded,
                      color: Colors.red,
                    ),
              Text(_mob_calc.umidadeAtual[index].toStringAsPrecision(4)),
              Text(_mob_calc.lamina[index].toStringAsPrecision(3)),
              Text(_mob_calc.tempo[index].toStringAsPrecision(2)),
            ],
          ),
        ),
        VerticalDivider(
          thickness: 1,
        ),
      ],
    );
  }
}
