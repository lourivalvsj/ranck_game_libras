// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:ranck_game_libras/app/modules/modalidade/models/modalidade_model.dart';
import 'package:ranck_game_libras/app/modules/nivel_dificuldade/models/nivel_dificuldade_model.dart';

part 'pergunta_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Pergunta {
  String? id;
  String imagem;
  List<String> opcoes;
  String respostaCorreta;
  int score;
  NivelDificuldade nivelDificuldade;
  List<Modalidade> modalidades;
  DateTime createdAt;

  Pergunta({
    this.id,
    required this.imagem,
    required this.opcoes,
    required this.respostaCorreta,
    required this.score,
    required this.nivelDificuldade,
    required this.modalidades,
    required this.createdAt,
  });

  factory Pergunta.fromJson(Map<String, dynamic> json) =>
      _$PerguntaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PerguntaToJson(this);
}
