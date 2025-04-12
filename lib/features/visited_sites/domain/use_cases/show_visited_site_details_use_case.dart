import 'package:dartz/dartz.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/show_site_details_entity.dart';

import '../../../../core/databases/errors/failure.dart';
import '../repository/visited_site_repository.dart';

class ShowVisitedSiteDetailsUseCase {
  final VisitedSiteRepository repository;
  ShowVisitedSiteDetailsUseCase({required this.repository});
  Future<Either<Failure, ShowSiteDetailsEntity>> call({required String id}) => repository.showSiteDetails(id:id);
}
