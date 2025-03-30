import 'package:equatable/equatable.dart';
import 'package:sites_management/features/users/domain/entities/get_users_entities/get_users_entity.dart';

class UserModel extends UserEntity with EquatableMixin {
  const UserModel({
    required super.id,
    required super.username,
    required super.role,
  });

  //model keys:
  static const String idKey = "id";
  static const String usernameKey = "username";
  static const String roleKey = "role";

  UserModel copyWith({
    int? id,
    String? username,
    String? role,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      role: role ?? this.role,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[idKey],
      username: json[usernameKey],
      role: json[roleKey],
    );
  }

  Map<String, dynamic> toJson() => {
        idKey: id,
        usernameKey: username,
        roleKey: role,
      };

  @override
  List<Object?> get props => [
        id,
        username,
        role,
      ];
}
