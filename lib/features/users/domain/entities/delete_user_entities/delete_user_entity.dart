import 'package:equatable/equatable.dart';

class DeleteUsersEntity extends Equatable {
  const DeleteUsersEntity({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [
        message,
      ];
}
