import 'package:dartz/dartz.dart';
import '../../../../core/databases/api/end_points.dart';
import '../../domain/entities/get_visited_sites_entities/get_visited_sites_entity.dart';

import '../../../../core/databases/connection/network_info.dart';
import '../../../../core/databases/errors/expentions.dart';
import '../../../../core/databases/errors/failure.dart';
import '../../domain/entities/add_visited_site_entities/add_visited_site_entity.dart';
import '../../domain/repository/visited_site_repository.dart';
import '../data sources/visited_site_remote_data_source.dart';
import '../services/visited_site_event_bus.dart';

class VisitedSiteRepositoryImple extends VisitedSiteRepository {
  final NetworkInfo networkInfo;
  final VisitedSiteRemoteDataSource remoteDataSource;
  final VisitedSitesEventBus visitedSitesEventBus;
  VisitedSiteRepositoryImple({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.visitedSitesEventBus,
  });
  @override
  Future<Either<Failure, AddVisitedSiteEntity>> addVisitedSite({required Map<String, dynamic> body}) async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await remoteDataSource.addVisitedSite(body: body);
        _emit(body);
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }

  @override
  Future<Either<Failure, List<GetVisitedSitesEntity>>> getVisitedSites() async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await remoteDataSource.getVisitedSites();

        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }

  _emit(Map<String, dynamic> body) {
    final siteGeneralInfo = GetVisitedSitesEntity(
      name: body[RequestKeys.sites][RequestKeys.name],
      code: body[RequestKeys.sites][RequestKeys.code],
      city: body[RequestKeys.sites][RequestKeys.city],
      street: body[RequestKeys.sites][RequestKeys.street],
      area: body[RequestKeys.sites][RequestKeys.area],
    );
    visitedSitesEventBus.emit(VisitedSiteAddedEvent(siteGeneralInfo));
  }
}
