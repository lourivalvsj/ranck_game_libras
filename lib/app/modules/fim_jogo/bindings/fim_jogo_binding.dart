import 'package:get/get.dart';
import 'package:ranck_game_libras/app/modules/fim_jogo/controllers/fim_jogo_controller.dart';

class FimJogoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FimJogoController());
  }
}
