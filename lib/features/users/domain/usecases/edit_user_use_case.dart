import 'package:dartz/dartz.dart';
import 'package:sites_management/features/users/domain/repository/users_repository.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entities/edit_user_entities/edit_user_entity.dart';

class EditUserUseCase {
  final UsersRepository repository;

  EditUserUseCase({required this.repository});

  Future<Either<Failure, EditUsersEntity>> call({required Map<String, dynamic> body}) {
    return repository.editUser(body);
  }
}
