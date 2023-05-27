class Pergunta {
  String imagem;
  List<String> opcoes;
  int respostaCorreta;
  int score;

  Pergunta({
    required this.imagem,
    required this.opcoes,
    required this.respostaCorreta,
    required this.score,
  });
}
