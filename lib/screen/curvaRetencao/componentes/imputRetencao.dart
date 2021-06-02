import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get_it/get_it.dart';

import 'package:plant_1/mobx/config/mob_config.dart';

class ImputCurvaRetencao extends StatelessWidget {
  final Mob_Config _mob_config = GetIt.I<Mob_Config>();
  final int indexx;
  final int indexy;
  String titulo;
  String label;
  String hint;
  ImputCurvaRetencao({
    Key key,
    this.indexx,
    this.indexy,
    this.titulo,
    this.label,
    this.hint,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final _contro = MaskedTextController(
        mask: '0.0000',
        text: _mob_config.curvaRetencao[indexx][indexy].toString());
    return Container(
      margin: EdgeInsets.all(5),
      
      child: 
            Card(elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      
                      children: [
                        SizedBox(width: 15,),
                        Text(titulo),
                        SizedBox(width: 15,),
                        Expanded(child: Divider(thickness: 1,)),
                      
                        SizedBox(width: 15,),
                        
                      ],
                    ),
                    SizedBox(height: 15,),
                    TextField(
                     controller: _contro,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black54),
                      decoration: InputDecoration(    
                        isDense: true,
                        labelText: label,
                        hintText: hint,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                      onChanged: (valor) {
                        _mob_config.setCurvaRetencao(indexx, indexy, valor);
                      },
                    ),
                  SizedBox(height: 15,),
                  ],
                ),
              ),
      ),
    );
  }
}
