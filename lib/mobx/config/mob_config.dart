import 'package:mobx/mobx.dart';
import 'package:hive/hive.dart';
part 'mob_config.g.dart';

class Mob_Config = _Mob_Config with _$Mob_Config;

abstract class _Mob_Config with Store {
  Box box;
  _Mob_Config() {
    carregaDataBase();

    autorun((_) {
      if (qtd_tensiometro < 0) {
        qtd_tensiometro = 0;
      }
      if (qtd_pontos_amostra < 0) {
        qtd_pontos_amostra = 0;
      }
      if (qtd_colunas < 0) {
        qtd_colunas = 0;
      }
      if (qtd_parcelas < 0) {
        qtd_parcelas = 0;
      }
    });
  }
  void carregaDataBase() async {
    box = await Hive.openBox('minhaCaixa');
    box.put('qtd_parcelas', 1);
    if (await box.get('qtdTensiometro') == null) {
      await box.put('qtdTensiometro', 0);
    }
    if (await box.get('colunas') == null) {
      await box.put('colunas', 0);
    }
    if (await box.get('qtd_pontos_amostra') == null) {
      await box.put('qtd_pontos_amostra', 0);
    }
    if (await box.get('qtd_parcelas') == null) {
      await box.put('qtd_parcelas', 0);
    }

    qtd_tensiometro = await box.get('qtdTensiometro');
    qtd_colunas = await box.get('colunas');
    qtd_pontos_amostra = await box.get('qtd_pontos_amostra');
    qtd_parcelas = await box.get('qtd_parcelas');
    await inicialize();
  }

  void inicialize() async {
    for (var i = 0; i < qtd_tensiometro; i++) {
      sensores.add([
        box.get('qtdt' + i.toString() + '0'),
        box.get('qtdt' + i.toString() + '1')
      ]);
      //addTensiometro();
    }

    /// ****************linhas *******************************************
    for (var i = 0; i < qtd_pontos_amostra; i++) {
      if (await box.get('linha' + (i).toString()) == null) {
        amostras.add((i + 1).toString());
      } else {
        amostras.add(await box.get('linha' + (i).toString()));
      }
    }
    for (var i = 0; i < qtd_pontos_amostra; i++) {
      List<String> aux = [];
      for (var j = 0; j < qtd_colunas; j++) {
        aux.add('0');
      }
      dados.add(aux);
    }

    /// ****************colunas *******************************************
    for (var i = 0; i < qtd_colunas; i++) {
      if (await box.get('colum' + (i).toString()) == null) {
        colunas.add((i + 1).toString());
      } else {
        colunas.add(await box.get('colum' + (i).toString()));
      }
    }
    /*for (var i = 0; i < qtd_pontos_amostra; i++) {
      dados[i].add('0');
    }*/
    //************dados*************** */
    for (var i = 0; i < qtd_pontos_amostra; i++) {
      for (var j = 0; j < qtd_colunas; j++) {
        if (await box.get('dado' + (i).toString() + '-' + (j).toString()) !=
            null) {
          dados[i][j] =
              await box.get('dado' + (i).toString() + '-' + (j).toString());
        }
      }
    }
    //*********curva retencao */

    for (var i = 0; i < qtd_parcelas; i++) {
      curvaRetencao.add(['', '', '', '']);
      for (var j = 0; j < 4; j++) {
        if (await box
                .get('curvaRetencao' + (i).toString() + '-' + (j).toString()) !=
            null) {
          curvaRetencao[i][j] = await box
              .get('curvaRetencao' + (i).toString() + '-' + (j).toString());
        }
      }
    }
    //******* */
    vazao = box.get('vazao');
    tensao = box.get('tensao');
    sistema_radicular = box.get('sistema_radicular');
    capacidade_campo = box.get('capacidade_campo');

    //
  }

  @observable
  List<List<String>> sensores = [];

  @observable
  List<String> amostras = [];

  @observable
  List<List<String>> dados = [];

  @observable
  List<List<String>> curvaRetencao = [];
  @observable
  List<String> curvaRetencaoaux = ['', '', '', ''];

  @observable
  List<String> colunas = ['Amostra'];

  @observable
  int qtd_tensiometro = 0;

  @observable
  int qtd_pontos_amostra = 5;

  @observable
  int qtd_colunas = 0;

  @observable
  int qtd_parcelas = 1;

  @observable
  String vazao = '';

  @observable
  String tensao = '';

  @observable
  String sistema_radicular = '';
  @observable
  String capacidade_campo = '';
  @action
  void setSensores(int indexx, int indexy, String valor) {
    sensores[indexx][indexy] = valor;
    box.put('qtdt' + indexx.toString() + indexy.toString(), valor);
  }

  @action
  void setDados(int indexx, int indexy, String valor) {
    dados[indexx][indexy] = valor;
    box.put('dado' + indexx.toString() + '-' + indexy.toString(), valor);
  }

  @action
  void setCurvaRetencao(int indexx, int indexy, String valor) {
    curvaRetencao[indexx][indexy] = valor;
    box.put(
        'curvaRetencao' + indexx.toString() + '-' + indexy.toString(), valor);
  }

  @action
  void setColunas(int index, String valor) {
    colunas[index] = valor;
    box.put('colum' + (index - 1).toString(), valor);
  }

  @action
  void setLinhas(int index, String valor) {
    amostras[index] = valor;
    box.put('linha' + (index).toString(), valor);
  }

  @action
  void setData(int valor) => qtd_tensiometro = valor;
  @action
  @action
  void addTensiometro() {
    sensores.add(['', '']);
    qtd_tensiometro++;
    box.put('qtdTensiometro', qtd_tensiometro);
  }

  @action
  void removeTensiometro() {
    box.put('qtdt' + (sensores.length - 1).toString() + '0', '');
    box.put('qtdt' + (sensores.length - 1).toString() + '1', '');
    sensores.removeLast();
    qtd_tensiometro--;
    box.put('qtdTensiometro', qtd_tensiometro);
  }

  @action
  void addDadosColunas() {
    for (var i = 0; i < qtd_pontos_amostra; i++) {
      dados[i].add('0');
    }
  }

  @action
  void removeDadosColunas() {
    for (var i = 0; i < qtd_pontos_amostra; i++) {
      dados[i].removeLast();
    }
  }

  @action
  void addDadosLinhas() {
    List<String> aux = [];
    for (var i = 0; i < qtd_colunas; i++) {
      aux.add('0');
    }

    dados.add(aux);
  }

  @action
  void removeDadosLinhas() {
    dados.removeLast();
  }

  @action
  void addColuna() {
    addDadosColunas();

    qtd_colunas++;
    if (box.get('colum' + (qtd_colunas - 1).toString()) == null) {
      colunas.add(qtd_colunas.toString());
    } else {
      colunas.add(box.get('colum' + (qtd_colunas - 1).toString()));
    }

    box.put('colunas', qtd_colunas);
  }

  @action
  void removecoluna() {
    qtd_colunas--;
    if (qtd_colunas < 0) {
      qtd_colunas = 0;
    } else {
      removeDadosColunas();
      colunas.removeLast();
      box.put('colunas', qtd_colunas);
    }
  }

  @action
  void addPontoAmostra() {
    addDadosLinhas();

    qtd_pontos_amostra++;
    if (box.get('linha' + (qtd_pontos_amostra - 1).toString()) == null) {
      amostras.add(qtd_pontos_amostra.toString());
    } else {
      amostras.add(box.get('linha' + (qtd_pontos_amostra - 1).toString()));
    }

    box.put('qtd_pontos_amostra', qtd_pontos_amostra);
  }

  @action
  void addParcela() {
    qtd_parcelas++;
    curvaRetencao.add(['', '', '', '']);
    box.put('qtd_parcelas', qtd_parcelas);
  }

  @action
  void removeParcela() {
    qtd_parcelas--;
    if (qtd_parcelas < 0) {
      qtd_parcelas = 0;
    } else {
      curvaRetencao.removeLast();
      box.put('qtd_parcelas', qtd_parcelas);
    }
  }

  @action
  void removePontoAmostra() {
    removeDadosLinhas();

    qtd_pontos_amostra--;
    amostras.removeLast();
    box.put('qtd_pontos_amostra', qtd_pontos_amostra);
  }

  @action
  void setVazao(String valor) {
    vazao = valor;
    box.put('vazao', valor);
  }

  @action
  void setTensao(String valor) {
    tensao = valor;
    box.put('tensao', valor);
  }

  @action
  void setSistema_radicular(String valor) {
    sistema_radicular = valor;
    box.put('sistema_radicular', valor);
  }

  @action
  void setCapacidade_campo(String valor) {
    capacidade_campo = valor;
    box.put('capacidade_campo', valor);
  }
}
