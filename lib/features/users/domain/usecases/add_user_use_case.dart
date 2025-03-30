import 'package:dartz/dartz.dart';
import 'package:sites_management/features/users/domain/repository/users_repository.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entities/add_user_entities/add_user_entity.dart';

class AddUserUseCase {
  final UsersRepository repository;

  AddUserUseCase({required this.repository});

  Future<Either<Failure, AddUserEntity>> call({required Map<String, dynamic> body}) {
    return repository.addUser(body);
  }
}


