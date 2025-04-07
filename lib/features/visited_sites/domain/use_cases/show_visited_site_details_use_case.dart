import 'package:dartz/dartz.dart';

import '../../../../core/databases/errors/failure.dart';
import '../../../../core/shared/models/message_model.dart';
import '../repository/visited_site_repository.dart';

class ShowVisitedSiteDetailsUseCase {
  final VisitedSiteRepository repository;
  ShowVisitedSiteDetailsUseCase({required this.repository});
  Future<Either<Failure, MessageModel>> call({required Map<String, dynamic> body, required String fileName}) => repository.exportSites(body: body, fileName: fileName);
}
