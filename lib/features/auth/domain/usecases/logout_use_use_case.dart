import 'package:dartz/dartz.dart';
import 'package:sites_management/core/databases/errors/failure.dart';
import 'package:sites_management/core/shared/entity/message_entity.dart';

import '../repository/repository.dart';

class LogoutUserUseCase {
  final UserRepository repository;

  LogoutUserUseCase({required this.repository});

  Future<Either<Failure, MessageEntity>> call() => repository.logout();
}
