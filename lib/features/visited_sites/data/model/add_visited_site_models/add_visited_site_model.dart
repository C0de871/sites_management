import '../../../../../core/databases/api/end_points.dart';
import '../../../domain/entities/add_visited_site_entities/add_visited_site_entity.dart';

class AddVisitedSiteModel extends AddVisitedSiteEntity {
  AddVisitedSiteModel({
    required super.message,
  });

  factory AddVisitedSiteModel.fromMap(Map<String, dynamic> json) {
    return AddVisitedSiteModel(
      message: json[ApiKey.message],
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.message: message,
      };
}
