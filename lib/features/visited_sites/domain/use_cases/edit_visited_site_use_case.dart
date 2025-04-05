import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../repository/visited_site_repository.dart';
import '../../../../core/shared/models/message_model.dart';

class EditVisitedSiteUseCase {
  final VisitedSiteRepository repository;

  EditVisitedSiteUseCase({required this.repository});

  Future<Either<Failure, MessageModel>> call({required Map<String, dynamic> body, required String id}) {
    return repository.editSite(body: body, id: id);
  }
}