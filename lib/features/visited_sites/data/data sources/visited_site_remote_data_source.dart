// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../../../../core/databases/cache/secure_storage_helper.dart';
import '../model/add_visited_site_models/add_visited_site_model.dart';

class VisitedSiteRemoteDataSource {
  final ApiConsumer api;
  final SecureStorageHelper cacheHelper;
  VisitedSiteRemoteDataSource({
    required this.api,
    required this.cacheHelper,
  });
  Future<AddVisitedSiteModel> postVisitedSite({required Map<String, dynamic> body}) async {
    final response = await api.post(
      EndPoints.postVisitedSite,
      data: body,
      isFormData: true,
    );
    return AddVisitedSiteModel.fromMap(response);
  }
}
