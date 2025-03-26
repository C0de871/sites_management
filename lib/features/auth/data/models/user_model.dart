import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel extends UserEntity with _$UserModel {
  const UserModel._({
    required super.username,
    required super.token,
    required super.role,
    required super.id,
  }) : super.name();
  @JsonSerializable(createToJson: true, explicitToJson: true)
  const factory UserModel({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "username") required String username,
    @JsonKey(name: "token") required String token,
    @JsonKey(name: "role") required String role,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
