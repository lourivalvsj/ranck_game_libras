import 'package:get/route_manager.dart';
import 'package:ranck_game_libras/app/modules/initial/bindings/initial_binding.dart';
import 'package:ranck_game_libras/app/modules/initial/pages/initial_page.dart';
import 'package:ranck_game_libras/app/modules/jogabilidade/bindings/jogabilidade_binding.dart';
import 'package:ranck_game_libras/app/modules/jogabilidade/pages/jogabilidade_page.dart';
import 'package:ranck_game_libras/app/modules/modalidade/bindings/modalidade_binding.dart';
import 'package:ranck_game_libras/app/modules/modalidade/pages/modalidade_page.dart';
import 'package:ranck_game_libras/app/modules/nivel_dificuldade/bindings/nivel_dificuldade_binding.dart';
import 'package:ranck_game_libras/app/modules/nivel_dificuldade/pages/nivel_dificuldade_page.dart';
import 'package:ranck_game_libras/utils/routes/app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;

  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => InitialPage(),
      bindings: [
        InitialBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.NIVEL_DIFICULDADE,
      page: () => NivelDificuldadePage(),
      bindings: [
        NivelDificuldadeBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.MODALIDADE,
      page: () => ModalidadePage(),
      bindings: [
        ModalidadeBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.JOGAR,
      page: () => JogabilidadePage(),
      bindings: [
        JogabilidadeBinding(),
      ],
    ),
  ];
}
