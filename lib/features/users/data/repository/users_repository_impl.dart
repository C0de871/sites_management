import 'package:dartz/dartz.dart';
import 'package:sites_management/features/users/data/datasources/users_remote_data_source.dart';
import 'package:sites_management/features/users/data/service/users_event_bus.dart';

import '../../../../core/databases/connection/network_info.dart';
import '../../../../core/databases/errors/expentions.dart';
import '../../../../core/databases/errors/failure.dart';
import '../../domain/entities/add_user_entities/add_user_entity.dart';
import '../../domain/entities/delete_user_entities/delete_user_entity.dart';
import '../../domain/entities/edit_user_entities/edit_user_entity.dart';
import '../../domain/entities/get_users_entities/get_users_entity.dart';
import '../../domain/repository/users_repository.dart';
import '../models/get_users_model/user_model.dart';

class UsersRepositoryImpl extends UsersRepository {
  final NetworkInfo networkInfo;
  final UsersRemoteDataSource remoteDataSource;
  final UsersEventBus eventBus;
  UsersRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.eventBus,
  });

  //! generate the methods implementation from the repository interface:

  @override
  Future<Either<Failure, GetUsersEntity>> getUsers() async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await remoteDataSource.getUsers();

        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }

  @override
  Future<Either<Failure, EditUsersEntity>> editUser(Map<String, dynamic> body) async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await remoteDataSource.editUser(body);
        eventBus.emit(
          UserUpdatedEvent(
            UserModel.fromJson(body),
          ),
        );

        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }

  @override
  Future<Either<Failure, AddUserEntity>> addUser(Map<String, dynamic> body) async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await remoteDataSource.addUser(body);
        //add eventbus:
        eventBus.emit(UserAddedEvent(
          UserModel.fromJson(body),
        ));
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }

  @override
  Future<Either<Failure, DeleteUsersEntity>> deleteUsers(Map<String, dynamic> body) async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await remoteDataSource.deleteUsers(body);
        eventBus.emit(UsersDeletedEvent(body["ids"]));
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }
}
