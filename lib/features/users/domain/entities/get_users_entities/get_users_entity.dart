import 'package:equatable/equatable.dart';

part 'user_entity.dart';

class GetUsersEntity extends Equatable {
  final List<UserEntity> users;

  const GetUsersEntity({
    required this.users,
  });

  @override
  List<Object?> get props => [users];
}
