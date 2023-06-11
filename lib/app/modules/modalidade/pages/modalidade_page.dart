import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/modules/modalidade/controllers/modalidade_controller.dart';
import 'package:ranck_game_libras/app/modules/modalidade/models/modalidade_model.dart';
import 'package:ranck_game_libras/app/modules/nivel_dificuldade/models/nivel_dificuldade_model.dart';
import 'package:ranck_game_libras/app/widgets/loading.dart';
import 'package:ranck_game_libras/app/widgets/primary-button.dart';
import 'package:ranck_game_libras/app/widgets/title-page.dart';
import 'package:ranck_game_libras/utils/routes/app_routes.dart';

class ModalidadePage extends StatelessWidget {
  ModalidadePage({super.key});

  NivelDificuldade nivelDificuldade = Get.arguments['nivelDificuldade'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // title: const Text('Modalidade'),
            ),
        body: FutureBuilder<List<Modalidade>?>(
          future: Get.find<ModalidadeController>().findAllModalidades(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                var modalidades = snapshot.data!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitlePage(
                      "MODALIDADE\n${nivelDificuldade.toString()}",
                      fontSize: 40,
                      textAlign: TextAlign.center,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: modalidades.length,
                        itemBuilder: (ctx, index) {
                          return PrimaryButton(
                            onPressed: () =>
                                Get.toNamed(AppRoutes.JOGAR, arguments: {
                              'modalidade': modalidades[index],
                              "nivelDificuldade": nivelDificuldade,
                            }),
                            child: Text(modalidades[index].nome),
                          );
                        }),
                  ],
                );
              } else {
                return const Center(
                  child: Text("Nenhuma modalidade encontrada..."),
                );
              }
            }
            return const Loading();
          },
        ));
  }
}
