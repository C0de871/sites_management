import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entities/add_visited_site_entities/add_visited_site_entity.dart';

abstract class VisitedSiteRepository {
  Future<Either<Failure, AddVisitedSiteEntity>> postVisitedSite({required Map<String, dynamic> body});
}
