import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

//import 'package:plan1/mobx/drawer/mob_drawer.dart';
import 'package:plant_1/mobx/drawer/mob_drawer.dart';

class SlideCuston extends StatefulWidget {
  final GlobalKey<ScaffoldState> cont;
  const SlideCuston({
    Key key,
    this.cont,
  }) : super(key: key);
  @override
  _SlideCustonState createState() => _SlideCustonState();
}

final Mob_Drawer mob = GetIt.I<Mob_Drawer>();

class _SlideCustonState extends State<SlideCuston> {
  List<Slide> slide = List();
  bool indexs = true;
  @override
  void initState() {
    slide.add(
      Slide(
        centerWidget: Image.asset(
          'image/tuto1.png',
          height: MediaQuery.of(widget.cont.currentContext).size.height / 3,
        ),
        backgroundColor: Colors.white,
        title: 'Menu',
        styleTitle: TextStyle(
            color: Colors.black87, fontSize: 35, fontWeight: FontWeight.bold),
        description:
            'Aqui onde você tera acesso a todo aplicatico.\n Clique no canto superior esquerdo ou arraste para o lado.',
        styleDescription: TextStyle(color: Colors.black87, fontSize: 17),
      ),
    );
    slide.add(Slide(
      centerWidget: Image.asset(
        'image/tuto2.png',
        height: MediaQuery.of(widget.cont.currentContext).size.height / 3,
      ),
      backgroundColor: Colors.green,
      title: 'Status',
      description:
          'Você poderá ver quando irrigar ou não, o tempo de irrigação. ',
    ));
    slide.add(Slide(
      centerWidget: Image.asset(
        'image/tuto3.png',
        height: MediaQuery.of(widget.cont.currentContext).size.height / 3,
      ),
      backgroundColor: Colors.white,
      title: 'Tensiometro',
      description:
          'Aqui onde é colocado a profundidade e a leitura de cada tensiometro. ',
      styleTitle: TextStyle(
          color: Colors.black87, fontSize: 35, fontWeight: FontWeight.bold),
      styleDescription: TextStyle(color: Colors.black87, fontSize: 17),
    ));
    slide.add(Slide(
      centerWidget: Image.asset(
        'image/tuto4.png',
        height: MediaQuery.of(widget.cont.currentContext).size.height / 3,
      ),
      backgroundColor: Colors.green,
      title: 'Curva de Retenção',
      description: 'É uma tabela para poder inseriri os dados de cada parcela.',
    ));
    slide.add(Slide(
      centerWidget: Image.asset(
        'image/tuto5.png',
        height: MediaQuery.of(widget.cont.currentContext).size.height / 3,
      ),
      backgroundColor: Colors.white,
      title: 'Configuração',
      description:
          'È aqui que define tudo no aplicativo, quantos tensiometros, quantas parcelas, etc. ',
      styleTitle: TextStyle(
          color: Colors.black87, fontSize: 35, fontWeight: FontWeight.bold),
      styleDescription: TextStyle(color: Colors.black87, fontSize: 17),
    ));
    slide.add(Slide(
      centerWidget: Image.asset(
        'image/tuto6.png',
        height: MediaQuery.of(widget.cont.currentContext).size.height / 3,
      ),
      backgroundColor: Colors.green,
      description:
          'Se tiver alguma duvida lembre-se que pode consultar esse tutorial quando quiser',
    ));

    super.initState();
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffb2dd3a),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffb2dd3a),
      size: 35.0,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffb2dd3a),
      size: 30.0,
    );
  }

  void onDonePress() {
    mob.data = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return IntroSlider(
          slides: slide,
          colorDot: Color(0xffb2dd3a),
          sizeDot: 10,
          typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

          renderSkipBtn: this.renderSkipBtn(),

          //colorSkipBtn: Color(0x33ffcc5c),
          //highlightColorSkipBtn: Color(0xffffcc5c),

          // Next button
          renderNextBtn: this.renderNextBtn(),
          onTabChangeCompleted: (e) {
            print(mob.indexTuto);
            mob.setIndexTuto(!mob.indexTuto);
            setState(() {});
          },
          // Done button
          renderDoneBtn: this.renderDoneBtn(),
          onDonePress: this.onDonePress,
          //  colorDoneBtn: Color(0x33ffcc5c),
          //highlightColorDoneBtn: Color(0xffffcc5c),
        );
      }),
    );
  }
}
