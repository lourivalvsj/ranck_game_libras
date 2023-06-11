// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'modalidade_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Modalidade {
  String nome;
  DateTime? createdAt;

  Modalidade({
    required this.nome,
    required this.createdAt,
  });

  factory Modalidade.fromJson(Map<String, dynamic> json) =>
      _$ModalidadeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ModalidadeToJson(this);
}
