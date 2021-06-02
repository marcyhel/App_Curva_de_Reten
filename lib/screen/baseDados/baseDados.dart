import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
//import 'package:plan1/mobx/config/mob_config.dart';
//import 'package:plan1/screen/baseDados/componentes/imputBaseDados.dart';

//import 'package:plan1/screen/componentes/appbar.dart';
import 'package:plant_1/mobx/config/mob_config.dart';
import 'package:plant_1/screen/componentes/appbar.dart';

import 'componentes/imputBaseDados.dart';
import 'componentes/text.dart';

final Mob_Config _mob_config = GetIt.I<Mob_Config>();

class BaseDados extends StatefulWidget {
  final GlobalKey<ScaffoldState> cont;
  BaseDados({
    Key key,
    this.cont,
  }) : super(key: key);

  @override
  _BaseDadosState createState() => _BaseDadosState(cont);
}

class _BaseDadosState extends State<BaseDados> {
  GlobalKey<ScaffoldState> cont;
  _BaseDadosState(this.cont);
  @override
  void initState() {
    print('base Dados');
    super.initState();
  }

  @override
  void dispose() {
    print('ff');
    super.dispose();
  }

  int conta = 0;
  int index = 0;
  int indeCo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCuston(
        titulo: 'Base de Dados',
        cont: cont,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: DataTable(
            columnSpacing: 20,
            columns: _mob_config.colunas.map((data) {
              return DataColumn(
                label: TextTabela(
                  text: data,
                ),
              );
            }).toList(),

            /* DataColumn(
                label: Text('Verfica'),
                tooltip: 'representação da vidada na terra'),*/
            /*DataRow(
              cells: [
                DataCell(
                  Text('data'),
                ),*/
            rows: _mob_config.amostras.map((data) {
              conta = 0;
              index++;
              return DataRow(
                color: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  indeCo++;

                  if (indeCo % 2 == 0) {
                    return Colors.blueGrey.withOpacity(0.1);
                  }
                }),
                cells: _mob_config.colunas.map((dat) {
                  conta++;

                  return DataCell(
                    (conta == 1)
                        ? Text(data)
                        : ImputBaseDados(
                            indexx: index - 1,
                            indexy: conta - 2,
                          ),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
