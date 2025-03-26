import 'package:dartz/dartz.dart';
import '../entities/get_visited_sites_entities/get_visited_sites_entity.dart';

import '../../../../core/databases/errors/failure.dart';
import '../repository/visited_site_repository.dart';

class GetVisitedSitesUseCase {
  final VisitedSiteRepository repository;

  GetVisitedSitesUseCase({required this.repository});

  Future<Either<Failure, List<GetVisitedSitesEntity>>> call() {
    return repository.getVisitedSites();
  }
}
