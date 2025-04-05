import 'package:dartz/dartz.dart';
import 'package:sites_management/core/shared/enums/visited_site_additional_images_type.dart';
import 'package:sites_management/core/shared/models/message_model.dart';
import 'package:sites_management/features/visited_sites/domain/entities/get_visited_site_images/get_visited_site_images_entity.dart';
import 'package:sites_management/features/visited_sites/domain/entities/show_site_details/show_site_details_entity.dart';
import '../../../../core/databases/api/end_points.dart';
import '../../domain/entities/get_visited_sites/get_visited_sites_entity.dart';

import '../../../../core/databases/connection/network_info.dart';
import '../../../../core/databases/errors/expentions.dart';
import '../../../../core/databases/errors/failure.dart';
import '../../domain/entities/add_visited_site/add_visited_site_entity.dart';
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

  @override
  Future<Either<Failure, MessageModel>> deleteSites({required Map<String, dynamic> body}) async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await remoteDataSource.deleteSites(body: body);
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }

  @override
  Future<Either<Failure, MessageModel>> editSite({required Map<String, dynamic> body, required String id}) async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await remoteDataSource.editSite(body: body, id: id);
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }

  @override
  Future<Either<Failure, MessageModel>> exportSites({required Map<String, dynamic> body, required String fileName}) async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await remoteDataSource.exportSites(body: body, fileName: fileName);
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }

  @override
  Future<Either<Failure, GetVisitedSiteImagesEntity>> getAdditionalSiteImages({required String id, required VisitedSiteAdditionalImagesType type}) async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await remoteDataSource.getAdditionalSiteImages(id: id, type: type);
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }

  @override
  Future<Either<Failure, GetVisitedSiteImagesEntity>> getSectionImages({required String id, required VisitedSiteAdditionalImagesType type}) async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await remoteDataSource.getSectionImages(id: id, type: type);
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }

  @override
  Future<Either<Failure, ShowSiteDetailsEntity>> showSiteDetails({required String id}) async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await remoteDataSource.showSiteDetails(id: id);
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }
}
