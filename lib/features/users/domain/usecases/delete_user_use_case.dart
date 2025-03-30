import 'package:dartz/dartz.dart';
import 'package:sites_management/features/users/domain/repository/users_repository.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entities/delete_user_entities/delete_user_entity.dart';

class DeleteUserUseCase {
  final UsersRepository repository;

  DeleteUserUseCase({required this.repository});

  Future<Either<Failure, DeleteUsersEntity>> call({required Map<String, dynamic> body}) {
    return repository.deleteUsers(body);
  }
}
