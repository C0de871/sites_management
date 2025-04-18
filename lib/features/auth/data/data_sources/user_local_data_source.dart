import 'dart:convert';
import 'dart:developer';

import '../../../../core/databases/api/end_points.dart';
import '../../../../core/databases/cache/storage_helper.dart';
import '../models/user_model.dart';

class UserLocalDataSource {
  final CacheHelper cacheHelper;

  UserLocalDataSource(this.cacheHelper);

  void saveAccessToken(String accessToken) {
    cacheHelper.saveData(
      key: CacheKey.accessToken,
      value: accessToken,
    );
  }

  Future<void> deleteAccessToken() async {
    cacheHelper.removeData(key: CacheKey.accessToken);
  }

  Future<void> deleteUser() async {
    cacheHelper.removeData(key: CacheKey.user);
  }

  void saveUser(UserModel user) {
    String userJson = jsonEncode((user).toJson());
    cacheHelper.saveData(key: CacheKey.user, value: userJson);
    log("user json is: $userJson");
  }

  Future<UserModel?> retrieveUser() async {
    String? userJson = await cacheHelper.getData(key: CacheKey.user);
    log("user json is: ${userJson ?? "null"}");
    if (userJson != null) {
      return UserModel.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  Future<String?> retrieveAccessToken() async {
    return await cacheHelper.getData(key: CacheKey.accessToken);
  }
}
