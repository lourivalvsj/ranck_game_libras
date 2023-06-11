// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pergunta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pergunta _$PerguntaFromJson(Map<String, dynamic> json) => Pergunta(
      imagem: json['imagem'] as String,
      opcoes:
          (json['opcoes'] as List<dynamic>).map((e) => e as String).toList(),
      respostaCorreta: json['respostaCorreta'] as String,
      score: json['score'] as int,
      nivelDificuldade: NivelDificuldade.fromJson(
          json['nivelDificuldade'] as Map<String, dynamic>),
      modalidades: (json['modalidades'] as List<dynamic>)
          .map((e) => Modalidade.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$PerguntaToJson(Pergunta instance) => <String, dynamic>{
      'imagem': instance.imagem,
      'opcoes': instance.opcoes,
      'respostaCorreta': instance.respostaCorreta,
      'score': instance.score,
      'nivelDificuldade': instance.nivelDificuldade.toJson(),
      'modalidades': instance.modalidades.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
