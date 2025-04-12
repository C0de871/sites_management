import 'package:dartz/dartz.dart';
import 'package:sites_management/features/visited_sites/domain/entities/get_visited_site_images/get_visited_site_images_entity.dart';

import '../../../../core/databases/errors/failure.dart';
import '../../../../core/shared/enums/visited_site_additional_images_type.dart';
import '../repository/visited_site_repository.dart';

class GetSectionVisitedSiteImagesUseCase {
  final VisitedSiteRepository repository;
  GetSectionVisitedSiteImagesUseCase({required this.repository});
  Future<Either<Failure, GetVisitedSiteImagesEntity>> call({required String id, required VisitedSiteSectionImagesType type}) => repository.getSectionImages(id:id,type: type);
}