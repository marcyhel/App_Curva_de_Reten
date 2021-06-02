import 'package:flutter/material.dart';

class AppBarCuston extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final GlobalKey<ScaffoldState> cont;

  String titulo;
  AppBarCuston({
    this.cont,
    this.titulo,
    Key key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          cont.currentState.openDrawer();
        },
      ),
      title: Text(titulo),
      centerTitle: true,
    );
  }
}
