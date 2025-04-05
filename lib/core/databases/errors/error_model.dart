import '../../shared/enums/storage_exception_type.dart';
import '../api/end_points.dart';

class NetworkErrorModel {
  final int status;
  final String errorMessage;

  NetworkErrorModel({required this.status, required this.errorMessage});
  factory NetworkErrorModel.fromJson(Map jsonData) {
    return NetworkErrorModel(
      errorMessage: jsonData[ApiKey.message],
      status: 200,
      //todo:
      // status: jsonData[ApiKey.statusCode],
    );
  }
}

class StorageErrorModel {
  final String errorMessage;
  final StorageExceptionType type;
  StorageErrorModel({required this.errorMessage, required this.type});
}
