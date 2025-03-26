// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      token: json['token'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'token': instance.token,
      'role': instance.role,
      'id': instance.id,
    };
