import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/modules/jogabilidade/controllers/jogabilidade_controller.dart';
import 'package:ranck_game_libras/app/storage/app-storage.dart';
import 'package:ranck_game_libras/app/theme/Theme.dart';
import 'package:ranck_game_libras/app/widgets/text-body.dart';
import 'package:ranck_game_libras/app/widgets/title-body.dart';
import 'package:ranck_game_libras/app/widgets/title-page.dart';
import 'package:ranck_game_libras/utils/constants.dart';

class FimJogoPage extends StatefulWidget {
  const FimJogoPage({super.key});

  @override
  State<FimJogoPage> createState() => _FimJogoPageState();
}

class _FimJogoPageState extends State<FimJogoPage> {
  final int score = Get.arguments['score'];

  final int qtdeCorretas = Get.arguments['qtdeCorretas'];

  final int qtdeIncorretas = Get.arguments['qtdeIncorretas'];

  @override
  void initState() {
    super.initState();
    Future(() => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: TitlePage('Resultado'),
              content: TitleBody('Pontuação: $score'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Reinicia o jogo ou executa alguma outra ação necessária
                  },
                ),
              ],
            );
          },
        ));

    Future(() => Get.find<JogabilidadeController>().atualizaScore(score));
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Fim do Jogo'),
      ),
      body: Column(
        children: [
          Container(
            constraints: BoxConstraints(minHeight: Get.height * 0.35),
            decoration: BoxDecoration(
              color: Get.theme.primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        TextBody(
                          "Acertos",
                          color: GameColors.secondary,
                        ),
                        TitleBody(
                          "$qtdeCorretas",
                          color: GameColors.secondary,
                        ),
                      ],
                    ),
                    Image.asset(
                      qtdeCorretas >= qtdeIncorretas
                          ? 'assets/images/feliz-removebg.png'
                          : 'assets/images/triste.png',
                      width: 200,
                      height: 200,
                    ),
                    Column(
                      children: [
                        TextBody(
                          "Erros",
                          color: GameColors.secondary,
                        ),
                        TitleBody(
                          "$qtdeIncorretas",
                          color: GameColors.secondary,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: defaultPadding),
                  child: Column(
                    children: [
                      TextBody(
                        "Score",
                        fontSize: 25,
                        color: GameColors.secondary,
                      ),
                      TitleBody(
                        "$score",
                        fontSize: 35,
                        color: GameColors.secondary,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: defaultPadding,
                      right: defaultPadding,
                      top: defaultPadding,
                      bottom: defaultPadding),
                  child: TitlePage(
                    (qtdeCorretas >= qtdeIncorretas
                            ? 'Parabéns '
                            : 'Não foi dessa vez ') +
                        AppStorage.instance.user.toString(),
                    color: GameColors.secondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => Get.back(),
            child: const Text('Jogar Novamente'),
          ),
        ],
      ),
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //         'Score: $score',
      //         style: const TextStyle(fontSize: 24),
      //       ),
      //       const SizedBox(height: 16),
      //       Text(
      //         'Perguntas corretas: $qtdeCorretas',
      //         style: const TextStyle(fontSize: 18),
      //       ),
      //       const SizedBox(height: 8),
      //       Text(
      //         'Perguntas erradas: $qtdeIncorretas',
      //         style: const TextStyle(fontSize: 18),
      //       ),
      //       const SizedBox(height: 16),
      //       ElevatedButton(
      //         onPressed: () => Get.back(),
      //         child: const Text('Jogar Novamente'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
