part of 'get_users_entity.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? username;
  final String? role;

  const UserEntity({
    required this.id,
    required this.username,
    required this.role,
  });

  UserEntity copyWith({
    int? id,
    String? username,
    String? role,
  }) {
    return UserEntity(
      id: id ?? this.id,
      username: username ?? this.username,
      role: role ?? this.role,
    );
  }

  @override
  List<Object?> get props => [id, username, role];
}
