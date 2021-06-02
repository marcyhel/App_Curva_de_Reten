import 'dart:ui';

import 'package:flutter/material.dart';

//import 'package:plan1/drawer/componente/opcao.dart';

import 'componente/cabecalho.dart';
import 'componente/opcao.dart';

class CustonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Stack(
          children: [
            BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 4.0,
                    sigmaY:
                        4.0), //this is dependent on the import statment above
                child:
                    Container(decoration: BoxDecoration(color: Colors.white))),
            ListView(
              //padding: EdgeInsets.zero,
              children: [
                Cabecalho(),
                SizedBox(
                  height: 10,
                ),
                Opcao(cont: context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
