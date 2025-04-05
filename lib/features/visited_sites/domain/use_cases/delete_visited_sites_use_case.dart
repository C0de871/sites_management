import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../../../../core/shared/models/message_model.dart';
import '../repository/visited_site_repository.dart';

class DeleteVisitedSitesUseCase {
  final VisitedSiteRepository repository;

  DeleteVisitedSitesUseCase({required this.repository});

  Future<Either<Failure, MessageModel>> call({required Map<String, dynamic> body}) {
    return repository.deleteSites(body: body);
  }
}
