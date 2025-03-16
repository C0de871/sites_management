import 'package:dartz/dartz.dart';

import '../../../../core/databases/connection/network_info.dart';
import '../../../../core/databases/errors/expentions.dart';
import '../../../../core/databases/errors/failure.dart';
import '../../domain/entities/add_visited_site_entities/add_visited_site_entity.dart';
import '../../domain/repository/visited_site_repository.dart';
import '../data sources/visited_site_remote_data_source.dart';

class VisitedSiteRepositoryImple extends VisitedSiteRepository {
  final NetworkInfo networkInfo;
  final VisitedSiteRemoteDataSource remoteDataSource;
  VisitedSiteRepositoryImple({required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, AddVisitedSiteEntity>> postVisitedSite({required Map<String, dynamic> body}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteTempleT = await remoteDataSource.postVisitedSite(body: body);

        return Right(remoteTempleT);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      //TODO make this message adapt to app language:
      return Left(Failure(errMessage: "There is no internet connnect"));
    }
  }
}
