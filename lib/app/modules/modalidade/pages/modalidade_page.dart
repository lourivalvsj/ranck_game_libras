import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/widgets/primary-button.dart';
import 'package:ranck_game_libras/app/widgets/title-page.dart';
import 'package:ranck_game_libras/utils/routes/app_routes.dart';

class ModalidadePage extends StatelessWidget {
  ModalidadePage({super.key});

  String nivel = Get.arguments['nivel'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text('Modalidade'),
          ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitlePage(
            "MODALIDADE\n$nivel",
            fontSize: 40,
            textAlign: TextAlign.center,
          ),
          PrimaryButton(
            onPressed: () => Get.toNamed(AppRoutes.JOGAR,
                arguments: {'modalidade': 'Numeral'}),
            child: const Text("Numeral"),
          ),
          PrimaryButton(
            onPressed: () => Get.toNamed(AppRoutes.JOGAR,
                arguments: {'modalidade': 'Numeral'}),
            child: const Text("Alfabeto"),
          ),
          PrimaryButton(
            onPressed: () => Get.toNamed(AppRoutes.JOGAR,
                arguments: {'modalidade': 'Numeral'}),
            child: const Text("Misto"),
          ),
        ],
      ),
    );
  }
}
