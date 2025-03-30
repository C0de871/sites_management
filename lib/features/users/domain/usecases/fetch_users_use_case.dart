import 'package:dartz/dartz.dart';
import 'package:sites_management/features/users/domain/repository/users_repository.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entities/get_users_entities/get_users_entity.dart';

class GetUsersUseCase {
  final UsersRepository repository;

  GetUsersUseCase({required this.repository});

  Future<Either<Failure, GetUsersEntity>> call() {
    return repository.getUsers();
  }
}
