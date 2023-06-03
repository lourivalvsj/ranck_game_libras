import 'package:json_annotation/json_annotation.dart';

part 'pergunta_model.g.dart';

@JsonSerializable(explicitToJson: true)
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

  factory Pergunta.fromJson(Map<String, dynamic> json) =>
      _$PerguntaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PerguntaToJson(this);
}
