// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      email: json['email'] as String,
      isAdmin: json['isAdmin'] as bool,
      score: json['score'] as int,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'isAdmin': instance.isAdmin,
      'score': instance.score,
    };
