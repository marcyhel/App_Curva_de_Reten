// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mob_drawer.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Mob_Drawer on _Mob_Drawer, Store {
  final _$dataAtom = Atom(name: '_Mob_Drawer.data');

  @override
  int get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(int value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$indexTutoAtom = Atom(name: '_Mob_Drawer.indexTuto');

  @override
  bool get indexTuto {
    _$indexTutoAtom.reportRead();
    return super.indexTuto;
  }

  @override
  set indexTuto(bool value) {
    _$indexTutoAtom.reportWrite(value, super.indexTuto, () {
      super.indexTuto = value;
    });
  }

  final _$_Mob_DrawerActionController = ActionController(name: '_Mob_Drawer');

  @override
  void setData(int valor) {
    final _$actionInfo =
        _$_Mob_DrawerActionController.startAction(name: '_Mob_Drawer.setData');
    try {
      return super.setData(valor);
    } finally {
      _$_Mob_DrawerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIndexTuto(bool valor) {
    final _$actionInfo = _$_Mob_DrawerActionController.startAction(
        name: '_Mob_Drawer.setIndexTuto');
    try {
      return super.setIndexTuto(valor);
    } finally {
      _$_Mob_DrawerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
indexTuto: ${indexTuto}
    ''';
  }
}
