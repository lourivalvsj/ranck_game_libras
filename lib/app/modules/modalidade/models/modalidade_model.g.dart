// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modalidade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Modalidade _$ModalidadeFromJson(Map<String, dynamic> json) => Modalidade(
      nome: json['nome'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ModalidadeToJson(Modalidade instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
