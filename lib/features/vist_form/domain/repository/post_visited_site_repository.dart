import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entities/post_visited_site_entity.dart';

abstract class PostVisitedSiteRepository {
  Future<Either<Failure, PostVisitedSiteEntity>> postVisitedSite({required Map<String,dynamic> body});
}
