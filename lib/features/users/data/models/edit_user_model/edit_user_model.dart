import 'package:equatable/equatable.dart';
import 'package:sites_management/features/users/domain/entities/edit_user_entities/edit_user_entity.dart';

class EditUsersModel extends EditUsersEntity with EquatableMixin {
  const EditUsersModel({
    required super.message,
  });

  static const String messageKey = "message";

  EditUsersModel copyWith({
    String? message,
  }) {
    return EditUsersModel(
      message: message ?? this.message,
    );
  }

  factory EditUsersModel.fromJson(Map<String, dynamic> json) {
    return EditUsersModel(
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
