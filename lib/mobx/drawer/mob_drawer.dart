import 'package:mobx/mobx.dart';

part 'mob_drawer.g.dart';

class Mob_Drawer = _Mob_Drawer with _$Mob_Drawer;

abstract class _Mob_Drawer with Store {
  @observable
  int data = 0;

  @observable
  bool indexTuto = true;

  @action
  void setData(int valor) => data = valor;
  @action
  void setIndexTuto(bool valor) => indexTuto = valor;
}
