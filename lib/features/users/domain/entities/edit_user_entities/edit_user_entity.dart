import 'package:equatable/equatable.dart';

class EditUsersEntity extends Equatable {
  const EditUsersEntity({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [
        message,
      ];
}
