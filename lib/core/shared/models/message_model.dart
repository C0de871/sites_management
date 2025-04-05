import 'package:equatable/equatable.dart';
import 'package:sites_management/core/shared/entity/message_entity.dart';

class MessageModel extends MessageEntity with EquatableMixin {
  const MessageModel({
    required super.message,
  });

  static const String messageKey = "message";

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
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
