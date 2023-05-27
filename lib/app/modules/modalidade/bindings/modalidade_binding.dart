import 'package:get/get.dart';
import 'package:ranck_game_libras/app/modules/modalidade/controllers/modalidade_controller.dart';

class ModalidadeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ModalidadeController());
  }
}
