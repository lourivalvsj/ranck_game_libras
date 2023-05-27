import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/widgets/primary-button.dart';
import 'package:ranck_game_libras/app/widgets/title-page.dart';
import 'package:ranck_game_libras/utils/routes/app_routes.dart';

class NivelDificuldadePage extends StatelessWidget {
  const NivelDificuldadePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text('NivelDificuldade'),
          ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitlePage(
            "NÍVEL DE DIFICULDADE",
            fontSize: 30,
          ),
          PrimaryButton(
            onPressed: () => Get.toNamed(AppRoutes.MODALIDADE,
                arguments: {'nivel': 'Básico'}),
            child: const Text("Básico"),
          ),
          PrimaryButton(
            onPressed: () => Get.toNamed(AppRoutes.MODALIDADE,
                arguments: {'nivel': 'Médio'}),
            child: const Text("Médio"),
          ),
          PrimaryButton(
            onPressed: () => Get.toNamed(AppRoutes.MODALIDADE,
                arguments: {'nivel': 'Avançado'}),
            child: const Text("Avançado"),
          ),
        ],
      ),
    );
  }
}
