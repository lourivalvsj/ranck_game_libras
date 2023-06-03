import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/modules/jogabilidade/models/pergunta_model.dart';

class JogabilidadeController extends GetxController {
  final collection =
      FirebaseFirestore.instance.collection("perguntas").snapshots();

  Future<List<Pergunta>> findAllPerguntas() async {
    var snapshot =
        await FirebaseFirestore.instance.collection("perguntas").get();

    return snapshot.docs.map((doc) {
      return Pergunta.fromJson(doc.data());
    }).toList();
  }
}
