import 'package:flutter/material.dart';
import 'package:ranck_game_libras/app/modules/jogabilidade/models/pergunta_model.dart';

class JogabilidadePage extends StatefulWidget {
  const JogabilidadePage({super.key});

  @override
  _JogabilidadePageState createState() => _JogabilidadePageState();
}

class _JogabilidadePageState extends State<JogabilidadePage> {
  int currentPerguntaIndex = 0;
  int score = 0;
  int? selectedAnswer;
  List<Pergunta> perguntas = [
    Pergunta(
      imagem: 'assets/images/alfabeto1.png',
      opcoes: ['Opção A', 'Opção B', 'Opção C', 'Opção D'],
      score: 2,
      respostaCorreta: 0,
    ),
    Pergunta(
      imagem: 'assets/images/alfabeto1.png',
      opcoes: ['Opção A', 'Opção B', 'Opção C', 'Opção D'],
      score: 3,
      respostaCorreta: 0,
    ),
    Pergunta(
      imagem: 'assets/images/alfabeto1.png',
      opcoes: ['Opção A', 'Opção B', 'Opção C', 'Opção D'],
      score: 1,
      respostaCorreta: 0,
    ),
    // Adicione aqui as demais perguntas
  ];

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
            title: const Text('Resultado'),
            content: Text('Pontuação: $score'),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perguntas e Respostas'),
      ),
      body: Column(
        children: [
          Image.asset(
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
                title: Text(perguntas[currentPerguntaIndex].opcoes[index]),
                leading: Radio<int>(
                  value: index,
                  groupValue: selectedAnswer,
                  onChanged: (int? value) {
                    setState(() {
                      selectedAnswer = value;
                    });
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
