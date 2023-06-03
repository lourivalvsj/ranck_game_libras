import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ranck_game_libras/app/modules/jogabilidade/controllers/jogabilidade_controller.dart';
import 'package:ranck_game_libras/app/modules/jogabilidade/models/pergunta_model.dart';
import 'package:ranck_game_libras/app/widgets/loading.dart';
import 'package:ranck_game_libras/app/widgets/title-body.dart';
import 'package:ranck_game_libras/app/widgets/title-page.dart';

class JogabilidadePage extends StatefulWidget {
  const JogabilidadePage({super.key});

  @override
  _JogabilidadePageState createState() => _JogabilidadePageState();
}

class _JogabilidadePageState extends State<JogabilidadePage> {
  int currentPerguntaIndex = 0;
  int score = 0;
  int? selectedAnswer;
  late List<Pergunta> perguntas;

  void verificaResposta(int selectedAnswer) {
    if (selectedAnswer == perguntas[currentPerguntaIndex].respostaCorreta) {
      setState(() {
        score += perguntas[currentPerguntaIndex].score;
      });
    }
    // Verifica se é a última pergunta
    if (currentPerguntaIndex < perguntas.length - 1) {
      setState(() {
        currentPerguntaIndex++;
      });
    } else {
      // Exibe o resultado final
      showDialog(
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
      );
    }
  }

  @override
  void initState() {
    super.initState();
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
          future: Get.find<JogabilidadeController>().findAllPerguntas(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                perguntas = snapshot.data!;

                return Column(
                  children: [
                    Image.network(
                      perguntas[currentPerguntaIndex].imagem,
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Pergunta ${currentPerguntaIndex + 1} de ${perguntas.length}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: perguntas[currentPerguntaIndex].opcoes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                              perguntas[currentPerguntaIndex].opcoes[index]),
                          leading: Radio<int>(
                            value: index,
                            groupValue: selectedAnswer,
                            onChanged: (int? value) {
                              verificaResposta(index);
                              setState(() {
                                selectedAnswer = value;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text("Nenhuma pergunta encontrada..."),
                );
              }
            }
            return const Loading();
          }),
    );
  }
}
