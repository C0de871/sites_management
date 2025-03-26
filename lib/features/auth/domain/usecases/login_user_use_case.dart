import 'package:dartz/dartz.dart';
import 'package:sites_management/core/databases/errors/failure.dart';
import 'package:sites_management/features/auth/domain/entities/user_entity.dart';

import '../repository/repository.dart';

class LoginUserUseCase {
  final UserRepository repository;

  LoginUserUseCase({required this.repository});

  Future<Either<Failure, UserEntity>> call({required Map<String, dynamic> body}) => repository.loginUser(body);
}
