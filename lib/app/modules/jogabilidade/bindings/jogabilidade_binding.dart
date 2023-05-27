import 'package:get/get.dart';
import 'package:ranck_game_libras/app/modules/jogabilidade/controllers/jogabilidade_controller.dart';

class JogabilidadeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(JogabilidadeController());
  }
}
