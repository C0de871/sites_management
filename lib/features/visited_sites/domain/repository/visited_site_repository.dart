import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entities/add_visited_site_entities/add_visited_site_entity.dart';
import '../entities/get_visited_sites_entities/get_visited_sites_entity.dart';

abstract class VisitedSiteRepository {
  Future<Either<Failure, AddVisitedSiteEntity>> addVisitedSite({required Map<String, dynamic> body});
  Future<Either<Failure, List<GetVisitedSitesEntity>>> getVisitedSites();
}
