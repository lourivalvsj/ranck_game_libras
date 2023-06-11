import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/modules/nivel_dificuldade/models/nivel_dificuldade_model.dart';

class NivelDificuldadeController extends GetxController {
  final collection =
      FirebaseFirestore.instance.collection("niveisDificuldade").snapshots();

  Future<List<NivelDificuldade>> findAllNiveisDificuldade() async {
    var snapshot = await FirebaseFirestore.instance
        .collection("niveisDificuldade")
        .orderBy(
            "createdAt") // Coloquei pra ordenar por data de creação pra ficar na mesma ordem que foi criado
        .get();

    return snapshot.docs.map((doc) {
      return NivelDificuldade.fromJson(doc.data());
    }).toList();
    // snapshot.docs.map((doc) {
    //   print(doc.id);
    // }).toList();
    // return [];
  }
}
