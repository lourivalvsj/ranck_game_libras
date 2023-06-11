import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/modules/modalidade/models/modalidade_model.dart';

class ModalidadeController extends GetxController {
  final collection =
      FirebaseFirestore.instance.collection("niveisDificuldade").snapshots();

  Future<List<Modalidade>> findAllModalidades() async {
    var snapshot = await FirebaseFirestore.instance
        .collection("modalidades")
        .orderBy(
            "createdAt") // Coloquei pra ordenar por data de creação pra ficar na mesma ordem que foi criado
        .get();

    return snapshot.docs.map((doc) {
      return Modalidade.fromJson(doc.data());
    }).toList();
    // snapshot.docs.map((doc) {
    //   print(doc.id);
    // }).toList();
    // return [];
  }
}
