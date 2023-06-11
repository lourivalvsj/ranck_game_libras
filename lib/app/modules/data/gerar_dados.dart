import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ranck_game_libras/app/modules/jogabilidade/models/pergunta_model.dart';
import 'package:ranck_game_libras/app/modules/modalidade/models/modalidade_model.dart';
import 'package:ranck_game_libras/app/modules/nivel_dificuldade/models/nivel_dificuldade_model.dart';

class GerarDados {
  static _deleteAllModalidades() async {
    var snapshot =
        await FirebaseFirestore.instance.collection("modalidades").get();

    for (QueryDocumentSnapshot document in snapshot.docs) {
      await FirebaseFirestore.instance
          .collection("modalidades")
          .doc(document.id)
          .delete();
      print("Modalidade ${document.id} excluída");
    }
  }

  static _deleteAllNiveisDificuldade() async {
    var snapshot =
        await FirebaseFirestore.instance.collection("niveisDificuldade").get();

    for (QueryDocumentSnapshot document in snapshot.docs) {
      await FirebaseFirestore.instance
          .collection("niveisDificuldade")
          .doc(document.id)
          .delete();
      print("Nível ${document.id} excluído");
    }
  }

  static _deleteAllPerguntas() async {
    var snapshot =
        await FirebaseFirestore.instance.collection("perguntas").get();

    for (QueryDocumentSnapshot document in snapshot.docs) {
      await FirebaseFirestore.instance
          .collection("perguntas")
          .doc(document.id)
          .delete();
      print("Pergunta ${document.id} excluída");
    }
  }

  static _deleteAll() async {
    await _deleteAllModalidades();
    await _deleteAllNiveisDificuldade();
    await _deleteAllPerguntas();
  }

  static insertAll() async {
    // Remove tudo que tem pra criar novamente...
    await _deleteAll();
    // Inserção dos níveis
    final niveis = [
      NivelDificuldade(
        nome: "Básico",
        createdAt: DateTime.now(),
      ),
      NivelDificuldade(
        nome: "Médio",
        createdAt: DateTime.now(),
      ),
      NivelDificuldade(
        nome: "Avançado",
        createdAt: DateTime.now(),
      ),
    ];

    niveis.forEach((nivel) async {
      await FirebaseFirestore.instance
          .collection('niveisDificuldade')
          .add(nivel.toJson())
          .then((value) => print("Nível ${value.id} adicionado"));
    });

    NivelDificuldade nivelBasico = await FirebaseFirestore.instance
        .collection('niveisDificuldade')
        .where('nome', isEqualTo: 'Básico')
        .limit(1)
        .get()
        .then((value) => NivelDificuldade.fromJson(value.docs.first.data()));

    NivelDificuldade nivelMedio = await FirebaseFirestore.instance
        .collection('niveisDificuldade')
        .where('nome', isEqualTo: 'Médio')
        .limit(1)
        .get()
        .then((value) => NivelDificuldade.fromJson(value.docs.first.data()));

    NivelDificuldade nivelAvancado = await FirebaseFirestore.instance
        .collection('niveisDificuldade')
        .where('nome', isEqualTo: 'Avançado')
        .limit(1)
        .get()
        .then((value) => NivelDificuldade.fromJson(value.docs.first.data()));
    // -------------------------------------------------------------------------

    // Inserção das modalidades
    final modalidades = [
      Modalidade(
        nome: "Alfabeto",
        createdAt: DateTime.now(),
      ),
      Modalidade(
        nome: "Numérico",
        createdAt: DateTime.now(),
      ),
      Modalidade(
        nome: "Misto",
        createdAt: DateTime.now(),
      ),
    ];

    modalidades.forEach((modalidade) async {
      await FirebaseFirestore.instance
          .collection('modalidades')
          .add(modalidade.toJson())
          .then((value) => print("Modalidade ${value.id} adicionada"));
    });

    Modalidade modalidadeAlfabeto = await FirebaseFirestore.instance
        .collection('modalidades')
        .where('nome', isEqualTo: 'Alfabeto')
        .limit(1)
        .get()
        .then((value) => Modalidade.fromJson(value.docs.first.data()));

    Modalidade modalidadeNumerico = await FirebaseFirestore.instance
        .collection('modalidades')
        .where('nome', isEqualTo: 'Numérico')
        .limit(1)
        .get()
        .then((value) => Modalidade.fromJson(value.docs.first.data()));

    Modalidade modalidadeMisto = await FirebaseFirestore.instance
        .collection('modalidades')
        .where('nome', isEqualTo: 'Misto')
        .limit(1)
        .get()
        .then((value) => Modalidade.fromJson(value.docs.first.data()));
    // -------------------------------------------------------------------------

    final perguntas = [
      Pergunta(
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoa.png?alt=media&token=30275c68-7a5d-4a36-8e19-226234736d64",
        opcoes: [
          "LETRA A",
          "LETRA B",
          "LETRA C",
          "LETRA D",
        ],
        respostaCorreta: "LETRA A",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
    ];

    perguntas.forEach((pergunta) async {
      await FirebaseFirestore.instance
          .collection('perguntas')
          .add(pergunta.toJson())
          .then((value) => print("Pergunta ${value.id} adicionada"));
    });
  }
}
