import 'package:equatable/equatable.dart';

import '../get_users_entities/get_users_entity.dart';

class AddUserEntity extends Equatable {
  final UserEntity user;
  const AddUserEntity({required this.user});

  @override
  List<Object?> get props => [user];
}
