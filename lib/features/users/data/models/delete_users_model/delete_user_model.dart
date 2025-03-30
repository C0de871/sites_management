import 'package:equatable/equatable.dart';
import 'package:sites_management/features/users/domain/entities/delete_user_entities/delete_user_entity.dart';

class DeleteUsersModel extends DeleteUsersEntity with EquatableMixin {
  const DeleteUsersModel({
    required super.message,
  });

  static const String messageKey = "message";

  DeleteUsersModel copyWith({
    String? message,
  }) {
    return DeleteUsersModel(
      message: message ?? this.message,
    );
  }

  factory DeleteUsersModel.fromJson(Map<String, dynamic> json) {
    return DeleteUsersModel(
      message: json[messageKey],
    );
  }

  Map<String, dynamic> toJson() => {
        messageKey: message,
      };

  @override
  List<Object?> get props => [
        message,
      ];
}
