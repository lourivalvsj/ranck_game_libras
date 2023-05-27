import 'package:get/get.dart';
import 'package:ranck_game_libras/app/modules/nivel_dificuldade/controllers/nivel_dificuldade_controller.dart';

class NivelDificuldadeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NivelDificuldadeController());
  }
}
