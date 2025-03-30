import 'package:equatable/equatable.dart';
import 'package:sites_management/features/users/domain/entities/get_users_entities/get_users_entity.dart';

import 'user_model.dart';

class GetUsersModel extends GetUsersEntity with EquatableMixin {
  const GetUsersModel({
    required super.users,
  });

  static const String usersKey = "users";

  GetUsersModel copyWith({
    List<UserModel>? users,
  }) {
    return GetUsersModel(
      users: users ?? this.users,
    );
  }

  factory GetUsersModel.fromJson(Map<String, dynamic> json) {
    return GetUsersModel(
      users: json[usersKey] == null ? [] : List<UserModel>.from(json[usersKey]!.map((x) => UserModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        usersKey: users.map((x) => (x as UserModel).toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        users,
      ];
}
