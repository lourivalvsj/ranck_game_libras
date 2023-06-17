// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String name;
  String email;
  bool isAdmin;
  int score;

  User({
    required this.name,
    required this.email,
    required this.isAdmin,
    required this.score,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return name;
  }
}
