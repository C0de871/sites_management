// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sites_management/features/visited_sites/data/model/get_visited_sites_models/get_visited_sites_model.dart';

import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../model/add_visited_site_models/add_visited_site_model.dart';

class VisitedSiteRemoteDataSource {
  final ApiConsumer api;
  VisitedSiteRemoteDataSource({
    required this.api,
  });
  Future<AddVisitedSiteModel> addVisitedSite({required Map<String, dynamic> body}) async {
    final response = await api.post(
      EndPoints.postVisitedSite,
      data: body,
      isFormData: true,
    );
    return AddVisitedSiteModel.fromMap(response);
  }


  Future<List<GetVisitedSitesModel>> getVisitedSites() async {
    final List response = await api.get(
      EndPoints.getVisitedSites,
    );
    return response.map((site) => GetVisitedSitesModel.fromMap(site)).toList();
  }
}
