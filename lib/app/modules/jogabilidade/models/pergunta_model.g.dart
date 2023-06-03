// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pergunta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pergunta _$PerguntaFromJson(Map<String, dynamic> json) => Pergunta(
      imagem: json['imagem'] as String,
      opcoes:
          (json['opcoes'] as List<dynamic>).map((e) => e as String).toList(),
      respostaCorreta: json['respostaCorreta'] as int,
      score: json['score'] as int,
    );

Map<String, dynamic> _$PerguntaToJson(Pergunta instance) => <String, dynamic>{
      'imagem': instance.imagem,
      'opcoes': instance.opcoes,
      'respostaCorreta': instance.respostaCorreta,
      'score': instance.score,
    };
