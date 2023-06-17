import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/modules/jogabilidade/controllers/jogabilidade_controller.dart';
import 'package:ranck_game_libras/app/modules/jogabilidade/models/pergunta_model.dart';
import 'package:ranck_game_libras/app/modules/modalidade/models/modalidade_model.dart';
import 'package:ranck_game_libras/app/modules/nivel_dificuldade/models/nivel_dificuldade_model.dart';
import 'package:ranck_game_libras/app/widgets/loading.dart';
import 'package:ranck_game_libras/app/widgets/title-page.dart';
import 'package:ranck_game_libras/utils/routes/app_routes.dart';

class JogabilidadePage extends StatefulWidget {
  const JogabilidadePage({Key? key}) : super(key: key);

  @override
  _JogabilidadePageState createState() => _JogabilidadePageState();
}

class _JogabilidadePageState extends State<JogabilidadePage> {
  NivelDificuldade nivelDificuldade = Get.arguments['nivelDificuldade'];
  Modalidade modalidade = Get.arguments['modalidade'];

  int currentPerguntaIndex = 0;
  int score = 0;
  String? selectedAnswer;
  late List<Pergunta> perguntas;
  Color? correctOptionColor;
  Color? incorrectOptionColor;

  int contadorCorretas = 0;
  int contadorIncorretas = 0;

  RxBool isLoading = false.obs;

  void verificaResposta(String? selectedAnswer) async {
    String respostaCorreta = perguntas[currentPerguntaIndex].respostaCorreta;
    isLoading(true);
    if (selectedAnswer == respostaCorreta) {
      setState(() {
        score += perguntas[currentPerguntaIndex].score;
        contadorCorretas++;
        correctOptionColor = Colors.green;
      });
    } else {
      setState(() {
        incorrectOptionColor = Colors.red;
        correctOptionColor = Colors.green;
        contadorIncorretas++;
      });
    }

    await Future.delayed(
        Duration(seconds: selectedAnswer == respostaCorreta ? 2 : 2), () {
      if (currentPerguntaIndex < perguntas.length - 1) {
        setState(() {
          currentPerguntaIndex++;
          this.selectedAnswer = null;
          correctOptionColor = null;
          incorrectOptionColor = null;
          isLoading(false);
        });
      } else {
        Get.offAndToNamed(
          AppRoutes.FIM_JOGO,
          arguments: {
            'qtdeCorretas': contadorCorretas,
            'qtdeIncorretas': contadorIncorretas,
            'score': score,
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perguntas e Respostas'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TitlePage(
              score.toString(),
              color: Colors.white,
              fontSize: 30,
            ),
          )
        ],
      ),
      body: FutureBuilder<List<Pergunta>?>(
        future: Get.find<JogabilidadeController>().findAllPerguntas(
            nivelDificuldade: nivelDificuldade, modalidade: modalidade),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text(
                    "Nenhuma pergunta encontrada para o nível\ne a modalidade escolhida...",
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                perguntas = snapshot.data!;
                return AnimatedOpacity(
                  opacity: currentPerguntaIndex < perguntas.length ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    children: [
                      SizedBox(
                          width: 200,
                          height: 200,
                          child: CachedNetworkImage(
                            imageUrl: perguntas[currentPerguntaIndex].imagem,
                            placeholder: (context, url) => const SizedBox(
                                width: 25,
                                height: 25,
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          )),
                      const SizedBox(height: 20),
                      Text(
                        'Pergunta ${currentPerguntaIndex + 1} de ${perguntas.length}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            perguntas[currentPerguntaIndex].opcoes.length,
                        itemBuilder: (BuildContext context, int index) {
                          final option =
                              perguntas[currentPerguntaIndex].opcoes[index];
                          final isCorrectAnswer = option ==
                              perguntas[currentPerguntaIndex].respostaCorreta;
                          final isSelectedAnswer = option == selectedAnswer;

                          return ListTile(
                            title: Text(
                              option,
                              style: TextStyle(
                                color: isSelectedAnswer && isCorrectAnswer
                                    ? correctOptionColor
                                    : isSelectedAnswer && !isCorrectAnswer
                                        ? incorrectOptionColor
                                        : null,
                              ),
                            ),
                            leading: Obx(() => Radio<String>(
                                  value: option,
                                  groupValue: selectedAnswer,
                                  onChanged: isLoading.isTrue
                                      ? null
                                      : (String? value) {
                                          verificaResposta(value);
                                          setState(() {
                                            selectedAnswer = value;
                                          });
                                        },
                                )),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
            } else {
              return const Center(
                child: Text("Erro ao buscar perguntas"),
              );
            }
          }
          return const Loading();
        },
      ),
    );
  }
}
