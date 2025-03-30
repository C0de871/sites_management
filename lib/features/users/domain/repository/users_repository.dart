import 'package:dartz/dartz.dart';
import 'package:sites_management/features/users/domain/entities/add_user_entities/add_user_entity.dart';
import 'package:sites_management/features/users/domain/entities/delete_user_entities/delete_user_entity.dart';
import 'package:sites_management/features/users/domain/entities/edit_user_entities/edit_user_entity.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entities/get_users_entities/get_users_entity.dart';

abstract class UsersRepository {
  Future<Either<Failure, GetUsersEntity>> getUsers();
  Future<Either<Failure, EditUsersEntity>> editUser(Map<String, dynamic> body);
  Future<Either<Failure, AddUserEntity>> addUser(Map<String, dynamic> body);
  Future<Either<Failure, DeleteUsersEntity>> deleteUsers(Map<String, dynamic> body);
}
