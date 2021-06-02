import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

//import 'package:plan1/mobx/config/mob_config.dart';
import 'package:plant_1/mobx/config/mob_config.dart';

class ImputProfund extends StatelessWidget {
  final Mob_Config _mob_config = GetIt.I<Mob_Config>();
  int numSensor;

  ImputProfund({
    Key key,
    this.numSensor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _contro1 = TextEditingController(
        text:( _mob_config.sensores[numSensor][0].toString() ==  'null')?"": _mob_config.sensores[numSensor][0].toString());
    final _contro2 = TextEditingController(
        text: (_mob_config.sensores[numSensor][1].toString() == 'null')?"":_mob_config.sensores[numSensor][1].toString() );
    return Container(
      margin: EdgeInsets.all(3),
      
      child: Card(
        
        elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'sensor ' + (numSensor + 1).toString(),
                style: TextStyle(fontSize: 17),
            ),
            SizedBox(
                height: 8,
            ),
            Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Observer(builder: (_) {
                      return TextField(
                        controller: _contro1,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black54),
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Profundidade',
                          hintText: 'Profundidade',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        onChanged: (valor) {
                          _mob_config.setSensores(numSensor, 0, valor);
                        },
                      );
                    }),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 4,
                    child: Observer(builder: (_) {
                      return TextField(
                        controller: _contro2,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black54),
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Tensiometro (kPa)',
                          hintText: 'Tensiometro',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        onChanged: (valor) {
                          _mob_config.setSensores(numSensor, 1, valor);
                        },
                      );
                    }),
                  ),
                ],
            ),
          
            SizedBox(
                height: 10,
            ),
          ],
        ),
              ),
      ),
    );
  }
}
