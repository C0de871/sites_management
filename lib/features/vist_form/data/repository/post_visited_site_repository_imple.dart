import 'package:dartz/dartz.dart';

import '../../../../core/databases/connection/network_info.dart';
import '../../../../core/databases/errors/expentions.dart';
import '../../../../core/databases/errors/failure.dart';
import '../../domain/entities/post_visited_site_entity.dart';
import '../../domain/repository/post_visited_site_repository.dart';
import '../data sources/post_visited_site_remote_data_source.dart';

class PostVisitedSiteRepositoryImple extends PostVisitedSiteRepository {
  final NetworkInfo networkInfo;
  final PostVisitedSiteRemoteDataSource remoteDataSource;
  PostVisitedSiteRepositoryImple({required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, PostVisitedSiteEntity>> postVisitedSite({required Map<String,dynamic> body}) async {
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
