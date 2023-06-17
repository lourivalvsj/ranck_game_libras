import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/modules/nivel_dificuldade/controllers/nivel_dificuldade_controller.dart';
import 'package:ranck_game_libras/app/modules/nivel_dificuldade/models/nivel_dificuldade_model.dart';
import 'package:ranck_game_libras/app/storage/app-storage.dart';
import 'package:ranck_game_libras/app/widgets/loading.dart';
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
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                AppStorage.instance.setToken(null);
                AppStorage.instance.setUser(null);
                Navigator.of(context).pushNamed(
                  AppRoutes.LOGIN,
                );
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: FutureBuilder<List<NivelDificuldade>?>(
        future:
            Get.find<NivelDificuldadeController>().findAllNiveisDificuldade(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var niveis = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitlePage(
                    "NÍVEL DE DIFICULDADE",
                    fontSize: 30,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: niveis.length,
                      itemBuilder: (ctx, index) {
                        return PrimaryButton(
                          onPressed: () =>
                              Get.toNamed(AppRoutes.MODALIDADE, arguments: {
                            'nivelDificuldade': niveis[index],
                          }),
                          child: Text(
                            niveis[index].nome,
                          ),
                        );
                      }),
                ],
              );
            } else {
              return const Center(
                child: Text("Nenhum nível encontrado..."),
              );
            }
          }
          return const Loading();
        },
      ),
    );
  }
}
