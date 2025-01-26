import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entities/post_visited_site_entity.dart';
import '../repository/post_visited_site_repository.dart';

class PostVisitedSite {
  final PostVisitedSiteRepository repository;

  PostVisitedSite({required this.repository});

  Future<Either<Failure, PostVisitedSiteEntity>> call({required Map<String, dynamic> body}) {
    return repository.postVisitedSite(body: body);
  }
}
