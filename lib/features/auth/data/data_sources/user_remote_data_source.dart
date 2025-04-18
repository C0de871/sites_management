import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/shared/models/message_model.dart';
import '../models/user_model.dart';

import '../../../../core/databases/api/end_points.dart';

class UserRemoteDataSource {
  final ApiConsumer apiConsumer;

  UserRemoteDataSource(this.apiConsumer);

  Future<UserModel> login(Map<String, dynamic> body) async {
    final response = await apiConsumer.post(
      EndPoints.loginUser,
      data: body,
      extra: {"no_auth": true},
    );
    return UserModel.fromJson(response);
  }

  Future<MessageModel> logout() async {
    final response = await apiConsumer.get(
      EndPoints.logoutUser,
    );
    return MessageModel.fromJson(response);
  }
}
