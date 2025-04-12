import 'package:dartz/dartz.dart';
import 'package:sites_management/core/shared/entity/message_entity.dart';

import '../../../../core/databases/errors/failure.dart';
import '../../../../core/shared/enums/visited_site_additional_images_type.dart';
import '../../../../core/shared/models/message_model.dart';
import '../entities/add_visited_site/add_visited_site_entity.dart';
import '../entities/get_visited_site_images/get_visited_site_images_entity.dart';
import '../entities/get_visited_sites/get_visited_sites_entity.dart';
import '../entities/show_site_details/show_site_details_entity.dart';

abstract class VisitedSiteRepository {
  Future<Either<Failure, MessageEntity>> addVisitedSite({required Map<String, dynamic> body});
  Future<Either<Failure, List<GetVisitedSitesEntity>>> getVisitedSites();
  Future<Either<Failure, ShowSiteDetailsEntity>> showSiteDetails({required String id});
  Future<Either<Failure, MessageModel>> deleteSites({required Map<String, dynamic> body});
  Future<Either<Failure, MessageModel>> editSite({required Map<String, dynamic> body, required String id});
  Future<Either<Failure, GetVisitedSiteImagesEntity>> getAdditionalSiteImages({required String id, required VisitedSiteAdditionalImagesType type});
  Future<Either<Failure, GetVisitedSiteImagesEntity>> getSectionImages({required String id, required VisitedSiteSectionImagesType type});
  Future<Either<Failure, MessageModel>> exportSites({required Map<String, dynamic> body, required String fileName});
}
