class UserEntity {
  const UserEntity.name({
    required this.username,
    required this.token,
    required this.role,
    required this.id,
  });

  final String username;
  final String token;
  final String role;
  final int id;
}
