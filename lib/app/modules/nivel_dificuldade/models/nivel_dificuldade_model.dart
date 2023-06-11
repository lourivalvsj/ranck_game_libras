// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'nivel_dificuldade_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NivelDificuldade {
  String? id;
  String nome;
  DateTime? createdAt;

  NivelDificuldade({
    this.id,
    required this.nome,
    required this.createdAt,
  });

  factory NivelDificuldade.fromJson(Map<String, dynamic> json) =>
      _$NivelDificuldadeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NivelDificuldadeToJson(this);

  @override
  String toString() {
    return nome;
  }
}
