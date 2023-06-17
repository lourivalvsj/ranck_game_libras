import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/modules/jogabilidade/models/pergunta_model.dart';
import 'package:ranck_game_libras/app/modules/modalidade/models/modalidade_model.dart';
import 'package:ranck_game_libras/app/modules/nivel_dificuldade/models/nivel_dificuldade_model.dart';
import 'package:ranck_game_libras/app/storage/app-storage.dart';

class JogabilidadeController extends GetxController {
  final collection =
      FirebaseFirestore.instance.collection("perguntas").snapshots();

  Future<List<Pergunta>> findAllPerguntas({
    required NivelDificuldade nivelDificuldade,
    required Modalidade modalidade,
  }) async {
    var snapshot = await FirebaseFirestore.instance
        .collection("perguntas")
        .where('nivelDificuldade', isEqualTo: nivelDificuldade.toJson())
        .where('modalidades', arrayContains: modalidade.toJson())
        .get();

    return snapshot.docs.map((doc) => Pergunta.fromJson(doc.data())).toList();
  }

  atualizaScore(int score) async {
    var user = await FirebaseFirestore.instance
        .collection('users')
        .doc(AppStorage.instance.token)
        .get();

    int? scoreDB = user.data()?['score'];

    if (scoreDB != null && scoreDB > score) {
      return;
    } else {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(AppStorage.instance.token)
          .set({"score": score}, SetOptions(merge: true));
    }
  }
}
