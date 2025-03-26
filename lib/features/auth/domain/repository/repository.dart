import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> loginUser(Map<String, dynamic> body);
  Future<Either<Failure, String>> retrieveAccessToken();
  Future<Either<Failure, UserEntity>> retrieveUser();
}
