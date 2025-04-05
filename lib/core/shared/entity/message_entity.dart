import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  const MessageEntity({
    required this.message,
  });

  final String? message;

  MessageEntity copyWith({
    String? message,
  }) {
    return MessageEntity(
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        message,
      ];
}
