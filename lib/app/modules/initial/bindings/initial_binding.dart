import 'package:get/get.dart';
import 'package:ranck_game_libras/app/modules/initial/controllers/initial_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(InitialController());
  }
}
