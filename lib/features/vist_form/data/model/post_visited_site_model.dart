import '../../../../core/databases/api/end_points.dart';
import '../../domain/entities/post_visited_site_entity.dart';

class PostVisitedSiteModel extends PostVisitedSiteEntity {
  PostVisitedSiteModel({
    required super.message,
  });

  factory PostVisitedSiteModel.fromMap(Map<String, dynamic> json) {
    return PostVisitedSiteModel(
      message: json[ApiKey.message],
    );
  }

  Map<String, dynamic> toMap() => {
        ApiKey.message: message,
      };
}
