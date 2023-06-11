import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/modules/jogabilidade/models/pergunta_model.dart';
import 'package:ranck_game_libras/app/modules/modalidade/models/modalidade_model.dart';
import 'package:ranck_game_libras/app/modules/nivel_dificuldade/models/nivel_dificuldade_model.dart';

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

    return snapshot.docs.map((doc) {
      return Pergunta.fromJson(doc.data());
    }).toList();
    // snapshot.docs.map((doc) {
    //   print(doc.id);
    // }).toList();
    // return [];
  }
}
