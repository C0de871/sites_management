import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../entities/add_visited_site_entities/add_visited_site_entity.dart';
import '../repository/visited_site_repository.dart';

class AddVisitedSite {
  final VisitedSiteRepository repository;

  AddVisitedSite({required this.repository});

  Future<Either<Failure, AddVisitedSiteEntity>> call({required Map<String, dynamic> body}) {
    return repository.postVisitedSite(body: body);
  }
}
