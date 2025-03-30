import 'package:equatable/equatable.dart';
import 'package:sites_management/features/users/data/models/get_users_model/user_model.dart';
import 'package:sites_management/features/users/domain/entities/add_user_entities/add_user_entity.dart';

class AddUserModel extends AddUserEntity with EquatableMixin {
  const AddUserModel({
    required super.user,
  });

  static const String userKey = "user";

  AddUserModel copyWith({
    UserModel? user,
  }) {
    return AddUserModel(
      user: user ?? this.user,
    );
  }

  factory AddUserModel.fromJson(Map<String, dynamic> json) {
    return AddUserModel(
      user: UserModel.fromJson(json[userKey]),
    );
  }

  Map<String, dynamic> toJson() => {
        userKey: (user as UserModel).toJson(),
      };

  @override
  List<Object?> get props => [
        user,
      ];
}
