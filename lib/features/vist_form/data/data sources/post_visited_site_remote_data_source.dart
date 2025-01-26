// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../../../../core/databases/cache/secure_storage_helper.dart';
import '../model/post_visited_site_model.dart';

class PostVisitedSiteRemoteDataSource {
  final ApiConsumer api;
  final SecureStorageHelper cacheHelper;
  PostVisitedSiteRemoteDataSource({
    required this.api,
    required this.cacheHelper,
  });
  Future<PostVisitedSiteModel> postVisitedSite({required Map<String,dynamic> body}) async {
    final response = await api.post(
      "${EndPoints.postVisitedSite}",
      data: body
    );
    return PostVisitedSiteModel.fromMap(response);
  }
}
