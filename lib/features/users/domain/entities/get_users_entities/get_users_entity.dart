import 'package:equatable/equatable.dart';

part 'user_entity.dart';

class GetUsersEntity extends Equatable {
  final List<UserEntity> users;

  const GetUsersEntity({
    required this.users,
  });

  //generate copywith
  GetUsersEntity copyWith({
    List<UserEntity>? users,
  }) {
    return GetUsersEntity(
      users: users ?? this.users,
    );
  }

  @override
  List<Object?> get props => [users];
}
