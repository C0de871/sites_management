import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../../../../core/shared/entity/message_entity.dart';
import '../entities/add_visited_site/add_visited_site_entity.dart';
import '../repository/visited_site_repository.dart';

class AddVisitedSiteUseCase {
  final VisitedSiteRepository repository;

  AddVisitedSiteUseCase({required this.repository});

  Future<Either<Failure, MessageEntity>> call({required Map<String, dynamic> body}) {
    return repository.addVisitedSite(body: body);
  }
}
