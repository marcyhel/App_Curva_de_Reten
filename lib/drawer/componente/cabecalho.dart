import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math';

class Cabecalho extends StatelessWidget {
  final Random rand = Random();
  List<String> img = [
    'image/tumb.jpg',
    'image/tumb2.jpg',
    'image/tumb3.jpg',
    'image/tumb4.jpg',
    'image/tumb5.jpg',
    'image/tumb6.jpg',
    'image/tumb7.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    print(rand.nextInt(7));
    return Container(
      decoration: BoxDecoration(
        boxShadow:[BoxShadow(blurRadius:4,)],
        image: DecorationImage(
          image: AssetImage(img[rand.nextInt(7)]),
          fit: BoxFit.fill,
          //colorFilter:
            //  ColorFilter.mode(Colors.lightGreen[100], BlendMode.colorBurn),
        ),
        // color: Theme.of(context).accentColor,
      ),
      height: MediaQuery.of(context).size.height / 4,
      child: Center(
          child: Text(
        'Planilha',
        style: TextStyle(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.height / 15,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
