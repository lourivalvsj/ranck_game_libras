// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nivel_dificuldade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NivelDificuldade _$NivelDificuldadeFromJson(Map<String, dynamic> json) =>
    NivelDificuldade(
      id: json['id'] as String?,
      nome: json['nome'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$NivelDificuldadeToJson(NivelDificuldade instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
