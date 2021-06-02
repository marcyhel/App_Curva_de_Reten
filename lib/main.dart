import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:plan1/mobx/calculos/mob_calc.dart';

//import 'package:plan1/mobx/config/mob_config.dart';
//import 'package:plan1/screen/principal.dart';
import 'package:plant_1/screen/principal.dart';

import 'mobx/calculos/mob_calc.dart';
import 'mobx/config/mob_config.dart';
import 'mobx/drawer/mob_drawer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var box = await Hive.openBox('minhaCaixa');
  // box.put('marcy', 'natha');

  /*WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  var box = await Hive.openBox('minhaCaixa');
  // box.put('marcy','natha');
  print(box.get('marcy'));*/
  singletonsApp();
  runApp(MaterialApp(home: MyApp()));
}

Future _abrirCaixa() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  return await Hive.openBox('minhaCaixa');
}

void singletonsApp() {
  GetIt.I.registerSingleton(Mob_Drawer());
  GetIt.I.registerSingleton(Mob_Config());
  GetIt.I.registerSingleton(Mob_Calc());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Curva de Retenção',
      theme: ThemeData(
     
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.black54,
          displayColor: Colors.blue,
        ),
      ),
      home: Principal(),
    );
  }
}
