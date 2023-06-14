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
      //Pergunta Alfabeto Basico
      Pergunta( //albeto a
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoa.png?alt=media&token=30275c68-7a5d-4a36-8e19-226234736d64",
        opcoes: [
          "LETRA C",
          "LETRA B",
          "LETRA C",
          "LETRA A",
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
            Pergunta( //albeto b
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetob.png?alt=media&token=fd122352-52b3-4992-afed-b97e917a5047&_gl=1*ojneqh*_ga*MTY3NzA0Mjc4Ny4xNjg1OTg0MTU1*_ga_CW55HF8NVT*MTY4NjQ0OTA1Ni4xMS4xLjE2ODY0NTIxNTMuMC4wLjA.",
        opcoes: [
          "LETRA C",
          "LETRA B",
          "LETRA C",
          "LETRA D",
        ],
        respostaCorreta: "LETRA B",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto c
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoc.png?alt=media&token=2ee097d6-5494-4747-a9fe-d2ed41defe99",
        opcoes: [
          "LETRA D",
          "LETRA B",
          "LETRA C",
          "LETRA A",
        ],
        respostaCorreta: "LETRA C",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto D
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetod.png?alt=media&token=9607155c-f38f-4db8-874b-2bdaaadc34e8",
        opcoes: [
          "LETRA H",
          "LETRA E",
          "LETRA C",
          "LETRA D",
        ],
        respostaCorreta: "LETRA D",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto E
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoe.png?alt=media&token=1184de54-82ff-4c2e-affa-c5095fb6f684",
        opcoes: [
          "LETRA F",
          "LETRA E",
          "LETRA C",
          "LETRA D",
        ],
        respostaCorreta: "LETRA E",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto F
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetof.png?alt=media&token=1438140e-351c-48d8-844d-3050340ff734",
        opcoes: [
          "LETRA H",
          "LETRA F",
          "LETRA C",
          "LETRA I",
        ],
        respostaCorreta: "LETRA F",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto G
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetog.png?alt=media&token=00fbf674-ca9d-4c53-97db-0183bf900016",
        opcoes: [
          "LETRA H",
          "LETRA P",
          "LETRA C",
          "LETRA G",
        ],
        respostaCorreta: "LETRA G",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto H
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoh.png?alt=media&token=3d795db5-4c53-4197-af8b-136c526230cc",
        opcoes: [
          "LETRA M",
          "LETRA H",
          "LETRA C",
          "LETRA N",
        ],
        respostaCorreta: "LETRA H",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto I
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoi.png?alt=media&token=592809cf-90e0-4fe9-a83a-f16806b5c2bf",
        opcoes: [
          "LETRA O",
          "LETRA F",
          "LETRA C",
          "LETRA I",
        ],
        respostaCorreta: "LETRA I",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto J
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoj.png?alt=media&token=5deacded-d555-4429-9377-df41e2e6f155",
        opcoes: [
          "LETRA J",
          "LETRA K",
          "LETRA X",
          "LETRA D",
        ],
        respostaCorreta: "LETRA J",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto L
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetol.png?alt=media&token=06d5149b-3858-4dd3-aff2-78be0b4e9f87",
        opcoes: [
          "LETRA W",
          "LETRA K",
          "LETRA L",
          "LETRA F",
        ],
        respostaCorreta: "LETRA L",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto M
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetom.png?alt=media&token=053407b6-bd39-47ab-bffd-bc341f7b3d23",
        opcoes: [
          "LETRA Y",
          "LETRA M",
          "LETRA Ç",
          "LETRA V",
        ],
        respostaCorreta: "LETRA M",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto N
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabeton.png?alt=media&token=599b9af7-7445-44ca-a08b-4ac27b837f18",
        opcoes: [
          "LETRA W",
          "LETRA S",
          "LETRA N",
          "LETRA U",
        ],
        respostaCorreta: "LETRA N",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto O
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoo.png?alt=media&token=bb3efcea-8fcd-43a3-8e9f-d90b2b1d9f07",
        opcoes: [
          "LETRA R",
          "LETRA T",
          "LETRA C",
          "LETRA O",
        ],
        respostaCorreta: "LETRA O",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto P
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetop.png?alt=media&token=8e05137d-2a6d-4bdc-a03f-9d29081d86ec",
        opcoes: [
          "LETRA X",
          "LETRA Y",
          "LETRA F",
          "LETRA P",
        ],
        respostaCorreta: "LETRA P",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto Q
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoq.png?alt=media&token=cddab2fe-5088-4a54-b1ad-aa8a7e551ae1",
        opcoes: [
          "LETRA T",
          "LETRA E",
          "LETRA C",
          "LETRA Q",
        ],
        respostaCorreta: "LETRA Q",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto R
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetor.png?alt=media&token=a86e261d-cd5c-49f4-8f30-f25e44da14b0",
        opcoes: [
          "LETRA J",
          "LETRA R",
          "LETRA K",
          "LETRA V",
        ],
        respostaCorreta: "LETRA R",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ), 
            Pergunta( //albeto T
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetot.png?alt=media&token=a7bc3e94-fbed-4225-8189-623809122cc3",
        opcoes: [
          "LETRA W",
          "LETRA G",
          "LETRA K",
          "LETRA T",
        ],
        respostaCorreta: "LETRA T",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ), 
            Pergunta( //albeto U
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetou.png?alt=media&token=4da868bd-5649-4c2f-bef3-713a78121b38",
        opcoes: [
          "LETRA P",
          "LETRA U",
          "LETRA X",
          "LETRA D",
        ],
        respostaCorreta: "LETRA U",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto W
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetow.png?alt=media&token=b17daab2-a8de-4c46-964c-1dd85cf7ab12",
        opcoes: [
          "LETRA B",
          "LETRA E",
          "LETRA W",
          "LETRA N",
        ],
        respostaCorreta: "LETRA W",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto X
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetox.png?alt=media&token=30cf38cd-f2cf-421a-b6aa-14b473493164",
        opcoes: [
          "LETRA H",
          "LETRA Y",
          "LETRA F",
          "LETRA X",
        ],
        respostaCorreta: "LETRA X",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto Y
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoy.png?alt=media&token=898387e0-4423-48e8-939b-0f41e407f40d",
        opcoes: [
          "LETRA Q",
          "LETRA Y",
          "LETRA T",
          "LETRA D",
        ],
        respostaCorreta: "LETRA Y",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto Z
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoz.png?alt=media&token=718265fa-8e22-4c67-ab78-d348017de67b",
        opcoes: [
          "LETRA X",
          "LETRA B",
          "LETRA C",
          "LETRA Z",
        ],
        respostaCorreta: "LETRA Z",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto K
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetok.png?alt=media&token=315daf39-501a-4063-8528-0d4a79cfb8fe",
        opcoes: [
          "LETRA K",
          "LETRA E",
          "LETRA U",
          "LETRA Z",
        ],
        respostaCorreta: "LETRA K",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto S
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetos.png?alt=media&token=2fb275cc-9ade-4d34-bc7a-c41b59abebc1",
        opcoes: [
          "LETRA S",
          "LETRA P",
          "LETRA C",
          "LETRA W",
        ],
        respostaCorreta: "LETRA S",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ), 
            Pergunta( //albeto V
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetov.png?alt=media&token=8f6508a1-4d82-48ff-acfe-6a546ced9c97",
        opcoes: [
          "LETRA T",
          "LETRA S",
          "LETRA X",
          "LETRA V",
        ],
        respostaCorreta: "LETRA V",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto Ç
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabeto%C3%A7.png?alt=media&token=f388c7bc-0242-41b5-9c2c-62fc572f6622",
        opcoes: [
          "LETRA C",
          "LETRA B",
          "LETRA Ç",
          "LETRA O",
        ],
        respostaCorreta: "LETRA Ç",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
      //Pergunta Alfabeto Medio
      Pergunta( //albeto a
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoa.png?alt=media&token=30275c68-7a5d-4a36-8e19-226234736d64",
        opcoes: [
          "LETRA A",
          "LETRA B",
          "LETRA C",
          "LETRA D",
        ],
        respostaCorreta: "LETRA A",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto b
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetob.png?alt=media&token=fd122352-52b3-4992-afed-b97e917a5047&_gl=1*ojneqh*_ga*MTY3NzA0Mjc4Ny4xNjg1OTg0MTU1*_ga_CW55HF8NVT*MTY4NjQ0OTA1Ni4xMS4xLjE2ODY0NTIxNTMuMC4wLjA.",
        opcoes: [
          "LETRA A",
          "LETRA B",
          "LETRA C",
          "LETRA D",
        ],
        respostaCorreta: "LETRA B",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
      
            Pergunta( //albeto c
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoc.png?alt=media&token=2ee097d6-5494-4747-a9fe-d2ed41defe99",
        opcoes: [
          "LETRA D",
          "LETRA B",
          "LETRA C",
          "LETRA A",
        ],
        respostaCorreta: "LETRA C",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto D
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetod.png?alt=media&token=9607155c-f38f-4db8-874b-2bdaaadc34e8",
        opcoes: [
          "LETRA H",
          "LETRA E",
          "LETRA C",
          "LETRA D",
        ],
        respostaCorreta: "LETRA D",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto E
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoe.png?alt=media&token=1184de54-82ff-4c2e-affa-c5095fb6f684",
        opcoes: [
          "LETRA F",
          "LETRA E",
          "LETRA C",
          "LETRA D",
        ],
        respostaCorreta: "LETRA E",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto F
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetof.png?alt=media&token=1438140e-351c-48d8-844d-3050340ff734",
        opcoes: [
          "LETRA H",
          "LETRA F",
          "LETRA C",
          "LETRA I",
        ],
        respostaCorreta: "LETRA F",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto G
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetog.png?alt=media&token=00fbf674-ca9d-4c53-97db-0183bf900016",
        opcoes: [
          "LETRA H",
          "LETRA P",
          "LETRA C",
          "LETRA G",
        ],
        respostaCorreta: "LETRA G",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto H
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoh.png?alt=media&token=3d795db5-4c53-4197-af8b-136c526230cc",
        opcoes: [
          "LETRA M",
          "LETRA H",
          "LETRA C",
          "LETRA N",
        ],
        respostaCorreta: "LETRA H",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto I
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoi.png?alt=media&token=592809cf-90e0-4fe9-a83a-f16806b5c2bf",
        opcoes: [
          "LETRA O",
          "LETRA F",
          "LETRA C",
          "LETRA I",
        ],
        respostaCorreta: "LETRA I",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto J
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoj.png?alt=media&token=5deacded-d555-4429-9377-df41e2e6f155",
        opcoes: [
          "LETRA J",
          "LETRA K",
          "LETRA X",
          "LETRA D",
        ],
        respostaCorreta: "LETRA J",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto L
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetol.png?alt=media&token=06d5149b-3858-4dd3-aff2-78be0b4e9f87",
        opcoes: [
          "LETRA W",
          "LETRA K",
          "LETRA L",
          "LETRA F",
        ],
        respostaCorreta: "LETRA L",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto M
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetom.png?alt=media&token=053407b6-bd39-47ab-bffd-bc341f7b3d23",
        opcoes: [
          "LETRA Y",
          "LETRA M",
          "LETRA Ç",
          "LETRA V",
        ],
        respostaCorreta: "LETRA M",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto N
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabeton.png?alt=media&token=599b9af7-7445-44ca-a08b-4ac27b837f18",
        opcoes: [
          "LETRA W",
          "LETRA S",
          "LETRA N",
          "LETRA U",
        ],
        respostaCorreta: "LETRA N",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto O
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoo.png?alt=media&token=bb3efcea-8fcd-43a3-8e9f-d90b2b1d9f07",
        opcoes: [
          "LETRA R",
          "LETRA T",
          "LETRA C",
          "LETRA O",
        ],
        respostaCorreta: "LETRA O",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto P
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetop.png?alt=media&token=8e05137d-2a6d-4bdc-a03f-9d29081d86ec",
        opcoes: [
          "LETRA X",
          "LETRA Y",
          "LETRA F",
          "LETRA P",
        ],
        respostaCorreta: "LETRA P",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto Q
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoq.png?alt=media&token=cddab2fe-5088-4a54-b1ad-aa8a7e551ae1",
        opcoes: [
          "LETRA T",
          "LETRA E",
          "LETRA C",
          "LETRA Q",
        ],
        respostaCorreta: "LETRA Q",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto R
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetor.png?alt=media&token=a86e261d-cd5c-49f4-8f30-f25e44da14b0",
        opcoes: [
          "LETRA J",
          "LETRA R",
          "LETRA K",
          "LETRA V",
        ],
        respostaCorreta: "LETRA R",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ), 
            Pergunta( //albeto T
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetot.png?alt=media&token=a7bc3e94-fbed-4225-8189-623809122cc3",
        opcoes: [
          "LETRA W",
          "LETRA G",
          "LETRA K",
          "LETRA T",
        ],
        respostaCorreta: "LETRA T",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ), 
            Pergunta( //albeto U
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetou.png?alt=media&token=4da868bd-5649-4c2f-bef3-713a78121b38",
        opcoes: [
          "LETRA P",
          "LETRA U",
          "LETRA X",
          "LETRA D",
        ],
        respostaCorreta: "LETRA U",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto W
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetow.png?alt=media&token=b17daab2-a8de-4c46-964c-1dd85cf7ab12",
        opcoes: [
          "LETRA B",
          "LETRA E",
          "LETRA W",
          "LETRA N",
        ],
        respostaCorreta: "LETRA W",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto X
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetox.png?alt=media&token=30cf38cd-f2cf-421a-b6aa-14b473493164",
        opcoes: [
          "LETRA H",
          "LETRA Y",
          "LETRA F",
          "LETRA X",
        ],
        respostaCorreta: "LETRA X",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto Y
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoy.png?alt=media&token=898387e0-4423-48e8-939b-0f41e407f40d",
        opcoes: [
          "LETRA Q",
          "LETRA Y",
          "LETRA T",
          "LETRA D",
        ],
        respostaCorreta: "LETRA Y",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto Z
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoz.png?alt=media&token=718265fa-8e22-4c67-ab78-d348017de67b",
        opcoes: [
          "LETRA X",
          "LETRA B",
          "LETRA C",
          "LETRA Z",
        ],
        respostaCorreta: "LETRA Z",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto K
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetok.png?alt=media&token=315daf39-501a-4063-8528-0d4a79cfb8fe",
        opcoes: [
          "LETRA K",
          "LETRA E",
          "LETRA U",
          "LETRA Z",
        ],
        respostaCorreta: "LETRA K",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto S
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetos.png?alt=media&token=2fb275cc-9ade-4d34-bc7a-c41b59abebc1",
        opcoes: [
          "LETRA S",
          "LETRA P",
          "LETRA C",
          "LETRA W",
        ],
        respostaCorreta: "LETRA S",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ), 
            Pergunta( //albeto V
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetov.png?alt=media&token=8f6508a1-4d82-48ff-acfe-6a546ced9c97",
        opcoes: [
          "LETRA T",
          "LETRA S",
          "LETRA X",
          "LETRA V",
        ],
        respostaCorreta: "LETRA V",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto Ç
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabeto%C3%A7.png?alt=media&token=f388c7bc-0242-41b5-9c2c-62fc572f6622",
        opcoes: [
          "LETRA C",
          "LETRA B",
          "LETRA Ç",
          "LETRA O",
        ],
        respostaCorreta: "LETRA Ç",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
      //Pergunta Alfabeto Avancado
      Pergunta( //albeto a
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoa.png?alt=media&token=30275c68-7a5d-4a36-8e19-226234736d64",
        opcoes: [
          "LETRA A",
          "LETRA B",
          "LETRA C",
          "LETRA D",
        ],
        respostaCorreta: "LETRA A",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto b
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetob.png?alt=media&token=fd122352-52b3-4992-afed-b97e917a5047&_gl=1*ojneqh*_ga*MTY3NzA0Mjc4Ny4xNjg1OTg0MTU1*_ga_CW55HF8NVT*MTY4NjQ0OTA1Ni4xMS4xLjE2ODY0NTIxNTMuMC4wLjA.",
        opcoes: [
          "LETRA A",
          "LETRA B",
          "LETRA C",
          "LETRA D",
        ],
        respostaCorreta: "LETRA B",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto c
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoc.png?alt=media&token=2ee097d6-5494-4747-a9fe-d2ed41defe99",
        opcoes: [
          "LETRA D",
          "LETRA B",
          "LETRA C",
          "LETRA A",
        ],
        respostaCorreta: "LETRA C",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto D
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetod.png?alt=media&token=9607155c-f38f-4db8-874b-2bdaaadc34e8",
        opcoes: [
          "LETRA H",
          "LETRA E",
          "LETRA C",
          "LETRA D",
        ],
        respostaCorreta: "LETRA D",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto E
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoe.png?alt=media&token=1184de54-82ff-4c2e-affa-c5095fb6f684",
        opcoes: [
          "LETRA F",
          "LETRA E",
          "LETRA C",
          "LETRA D",
        ],
        respostaCorreta: "LETRA E",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto F
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetof.png?alt=media&token=1438140e-351c-48d8-844d-3050340ff734",
        opcoes: [
          "LETRA H",
          "LETRA F",
          "LETRA C",
          "LETRA I",
        ],
        respostaCorreta: "LETRA F",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto G
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetog.png?alt=media&token=00fbf674-ca9d-4c53-97db-0183bf900016",
        opcoes: [
          "LETRA H",
          "LETRA P",
          "LETRA C",
          "LETRA G",
        ],
        respostaCorreta: "LETRA G",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto H
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoh.png?alt=media&token=3d795db5-4c53-4197-af8b-136c526230cc",
        opcoes: [
          "LETRA M",
          "LETRA H",
          "LETRA C",
          "LETRA N",
        ],
        respostaCorreta: "LETRA H",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto I
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoi.png?alt=media&token=592809cf-90e0-4fe9-a83a-f16806b5c2bf",
        opcoes: [
          "LETRA O",
          "LETRA F",
          "LETRA C",
          "LETRA I",
        ],
        respostaCorreta: "LETRA I",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto J
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoj.png?alt=media&token=5deacded-d555-4429-9377-df41e2e6f155",
        opcoes: [
          "LETRA J",
          "LETRA K",
          "LETRA X",
          "LETRA D",
        ],
        respostaCorreta: "LETRA J",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto L
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetol.png?alt=media&token=06d5149b-3858-4dd3-aff2-78be0b4e9f87",
        opcoes: [
          "LETRA W",
          "LETRA K",
          "LETRA L",
          "LETRA F",
        ],
        respostaCorreta: "LETRA L",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto M
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetom.png?alt=media&token=053407b6-bd39-47ab-bffd-bc341f7b3d23",
        opcoes: [
          "LETRA Y",
          "LETRA M",
          "LETRA Ç",
          "LETRA V",
        ],
        respostaCorreta: "LETRA M",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto N
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabeton.png?alt=media&token=599b9af7-7445-44ca-a08b-4ac27b837f18",
        opcoes: [
          "LETRA W",
          "LETRA S",
          "LETRA N",
          "LETRA U",
        ],
        respostaCorreta: "LETRA N",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto O
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoo.png?alt=media&token=bb3efcea-8fcd-43a3-8e9f-d90b2b1d9f07",
        opcoes: [
          "LETRA R",
          "LETRA T",
          "LETRA C",
          "LETRA O",
        ],
        respostaCorreta: "LETRA O",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto P
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetop.png?alt=media&token=8e05137d-2a6d-4bdc-a03f-9d29081d86ec",
        opcoes: [
          "LETRA X",
          "LETRA Y",
          "LETRA F",
          "LETRA P",
        ],
        respostaCorreta: "LETRA P",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto Q
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoq.png?alt=media&token=cddab2fe-5088-4a54-b1ad-aa8a7e551ae1",
        opcoes: [
          "LETRA T",
          "LETRA E",
          "LETRA C",
          "LETRA Q",
        ],
        respostaCorreta: "LETRA Q",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto R
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetor.png?alt=media&token=a86e261d-cd5c-49f4-8f30-f25e44da14b0",
        opcoes: [
          "LETRA J",
          "LETRA R",
          "LETRA K",
          "LETRA V",
        ],
        respostaCorreta: "LETRA R",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ), 
            Pergunta( //albeto T
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetot.png?alt=media&token=a7bc3e94-fbed-4225-8189-623809122cc3",
        opcoes: [
          "LETRA W",
          "LETRA G",
          "LETRA K",
          "LETRA T",
        ],
        respostaCorreta: "LETRA T",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ), 
            Pergunta( //albeto U
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetou.png?alt=media&token=4da868bd-5649-4c2f-bef3-713a78121b38",
        opcoes: [
          "LETRA P",
          "LETRA U",
          "LETRA X",
          "LETRA D",
        ],
        respostaCorreta: "LETRA U",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto W
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetow.png?alt=media&token=b17daab2-a8de-4c46-964c-1dd85cf7ab12",
        opcoes: [
          "LETRA B",
          "LETRA E",
          "LETRA W",
          "LETRA N",
        ],
        respostaCorreta: "LETRA W",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto X
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetox.png?alt=media&token=30cf38cd-f2cf-421a-b6aa-14b473493164",
        opcoes: [
          "LETRA H",
          "LETRA Y",
          "LETRA F",
          "LETRA X",
        ],
        respostaCorreta: "LETRA X",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto Y
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoy.png?alt=media&token=898387e0-4423-48e8-939b-0f41e407f40d",
        opcoes: [
          "LETRA Q",
          "LETRA Y",
          "LETRA T",
          "LETRA D",
        ],
        respostaCorreta: "LETRA Y",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto Z
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetoz.png?alt=media&token=718265fa-8e22-4c67-ab78-d348017de67b",
        opcoes: [
          "LETRA X",
          "LETRA B",
          "LETRA C",
          "LETRA Z",
        ],
        respostaCorreta: "LETRA Z",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto K
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetok.png?alt=media&token=315daf39-501a-4063-8528-0d4a79cfb8fe",
        opcoes: [
          "LETRA K",
          "LETRA E",
          "LETRA U",
          "LETRA Z",
        ],
        respostaCorreta: "LETRA K",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto S
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetos.png?alt=media&token=2fb275cc-9ade-4d34-bc7a-c41b59abebc1",
        opcoes: [
          "LETRA S",
          "LETRA P",
          "LETRA C",
          "LETRA W",
        ],
        respostaCorreta: "LETRA S",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ), 
            Pergunta( //albeto V
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabetov.png?alt=media&token=8f6508a1-4d82-48ff-acfe-6a546ced9c97",
        opcoes: [
          "LETRA T",
          "LETRA S",
          "LETRA X",
          "LETRA V",
        ],
        respostaCorreta: "LETRA V",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
            Pergunta( //albeto Ç
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/alfabeto%2Falfabeto%C3%A7.png?alt=media&token=f388c7bc-0242-41b5-9c2c-62fc572f6622",
        opcoes: [
          "LETRA C",
          "LETRA B",
          "LETRA Ç",
          "LETRA O",
        ],
        respostaCorreta: "LETRA Ç",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeAlfabeto,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
      //Pergunta Numeral Basico
      Pergunta( //Numeral 0
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/numeral%2Fnumeral0.png?alt=media&token=53a3f40c-0c43-437b-8378-ad81c68bbad0&_gl=1*z3fliv*_ga*MTY3NzA0Mjc4Ny4xNjg1OTg0MTU1*_ga_CW55HF8NVT*MTY4NjQ0OTA1Ni4xMS4xLjE2ODY0NTI3NjkuMC4wLjA.",
        opcoes: [
          "NUMERO 0",
          "NUMERO 1",
          "NUMERO 2",
          "NUMERO 3",
        ],
        respostaCorreta: "NUMERO 0",
        score: 1,
        nivelDificuldade: nivelBasico,
        modalidades: [
          modalidadeNumerico,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
      //Pergunta Numeral Medio
      Pergunta( //Numeral 0
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/numeral%2Fnumeral0.png?alt=media&token=53a3f40c-0c43-437b-8378-ad81c68bbad0&_gl=1*z3fliv*_ga*MTY3NzA0Mjc4Ny4xNjg1OTg0MTU1*_ga_CW55HF8NVT*MTY4NjQ0OTA1Ni4xMS4xLjE2ODY0NTI3NjkuMC4wLjA.",
        opcoes: [
          "NUMERO 0",
          "NUMERO 1",
          "NUMERO 2",
          "NUMERO 3",
        ],
        respostaCorreta: "NUMERO 0",
        score: 2,
        nivelDificuldade: nivelMedio,
        modalidades: [
          modalidadeNumerico,
          modalidadeMisto,
        ],
        createdAt: DateTime.now(),
      ),
      //Pergunta Numeral Avancado
      Pergunta( //Numeral 0
        imagem:
            "https://firebasestorage.googleapis.com/v0/b/ranck-game-libras.appspot.com/o/numeral%2Fnumeral0.png?alt=media&token=53a3f40c-0c43-437b-8378-ad81c68bbad0&_gl=1*z3fliv*_ga*MTY3NzA0Mjc4Ny4xNjg1OTg0MTU1*_ga_CW55HF8NVT*MTY4NjQ0OTA1Ni4xMS4xLjE2ODY0NTI3NjkuMC4wLjA.",
        opcoes: [
          "NUMERO 0",
          "NUMERO 1",
          "NUMERO 2",
          "NUMERO 3",
        ],
        respostaCorreta: "NUMERO 0",
        score: 3,
        nivelDificuldade: nivelAvancado,
        modalidades: [
          modalidadeNumerico,
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
