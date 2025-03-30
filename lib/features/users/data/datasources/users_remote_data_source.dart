import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../models/add_user_model/add_user_model.dart';
import '../models/delete_users_model/delete_user_model.dart';
import '../models/edit_user_model/edit_user_model.dart';
import '../models/get_users_model/get_users_model.dart';

class UsersRemoteDataSource {
  final ApiConsumer api;

  UsersRemoteDataSource({required this.api});

  Future<GetUsersModel> getUsers() async {
    final response = await api.get(
      EndPoints.getUsers,
      extra: {"neeedAuth": true},
    );
    return GetUsersModel.fromJson(response);
  }

  Future<EditUsersModel> editUser(Map<String, dynamic> body) async {
    final response = await api.put(
      EndPoints.editUser,
      data: body,
      extra: {"neeedAuth": true},
    );
    return EditUsersModel.fromJson(response);
  }

  Future<AddUserModel> addUser(Map<String, dynamic> body) async {
    final response = await api.post(
      EndPoints.addUser,
      data: body,
      extra: {"neeedAuth": true},
    );
    return AddUserModel.fromJson(response);
  }

  Future<DeleteUsersModel> deleteUsers(Map<String, dynamic> body) async {
    final response = await api.delete(
      EndPoints.deleteUsers,
      data: body,
      extra: {"neeedAuth": true},
    );
    return DeleteUsersModel.fromJson(response);
  }
}
