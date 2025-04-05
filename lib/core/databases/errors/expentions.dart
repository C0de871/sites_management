import 'package:dio/dio.dart';

import '../../shared/enums/storage_exception_type.dart';
import 'error_model.dart';

//!ServerException
class ServerException implements Exception {
  final NetworkErrorModel errorModel;
  ServerException(this.errorModel);
}

//!CacheExeption
class CacheExeption implements Exception {
  final String errorMessage;
  CacheExeption({required this.errorMessage});
}

class StorageException implements Exception {
  final StorageErrorModel errorModel;
  StorageException(
    this.errorModel,
  );
}

class BadCertificateException extends ServerException {
  BadCertificateException(super.errorModel);
}

class ConnectionTimeoutException extends ServerException {
  ConnectionTimeoutException(super.errorModel);
}

class BadResponseException extends ServerException {
  BadResponseException(super.errorModel);
}

class ReceiveTimeoutException extends ServerException {
  ReceiveTimeoutException(super.errorModel);
}

class ConnectionErrorException extends ServerException {
  ConnectionErrorException(super.errorModel);
}

class SendTimeoutException extends ServerException {
  SendTimeoutException(super.errorModel);
}

class UnauthorizedException extends ServerException {
  UnauthorizedException(super.errorModel);
}

class ForbiddenException extends ServerException {
  ForbiddenException(super.errorModel);
}

class NotFoundException extends ServerException {
  NotFoundException(super.errorModel);
}

class CofficientException extends ServerException {
  CofficientException(super.errorModel);
}

class CancelException extends ServerException {
  CancelException(super.errorModel);
}

class UnprocessableContentException extends ServerException {
  UnprocessableContentException(super.errorModel);
}

class UnknownException extends ServerException {
  UnknownException(super.errorModel);
}


handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionError:
      throw ConnectionErrorException(NetworkErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw BadCertificateException(NetworkErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionTimeout:
      throw ConnectionTimeoutException(NetworkErrorModel.fromJson(e.response!.data));

    case DioExceptionType.receiveTimeout:
      throw ReceiveTimeoutException(NetworkErrorModel.fromJson(e.response!.data));

    case DioExceptionType.sendTimeout:
      throw SendTimeoutException(NetworkErrorModel.fromJson(e.response!.data));

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request

          throw BadResponseException(NetworkErrorModel.fromJson(e.response!.data));

        case 401: //unauthorized
          throw UnauthorizedException(NetworkErrorModel.fromJson(e.response!.data));

        case 403: //forbidden
          throw ForbiddenException(NetworkErrorModel.fromJson(e.response!.data));

        case 404: //not found
          throw NotFoundException(NetworkErrorModel.fromJson(e.response!.data));

        case 409: //cofficient

          throw CofficientException(NetworkErrorModel.fromJson(e.response!.data));

        case 422: //Unprocessable Content
          throw UnprocessableContentException(NetworkErrorModel.fromJson(e.response!.data));

        case 504: // Bad request
          throw BadResponseException(NetworkErrorModel(status: 504, errorMessage: e.response!.data));
        default:
          throw ServerException(NetworkErrorModel(status: e.response?.statusCode ?? 500, errorMessage: "unknown 5xx error"));
      }

    case DioExceptionType.cancel:
      throw CancelException(NetworkErrorModel(errorMessage: e.toString(), status: 500));

    case DioExceptionType.unknown:
      throw UnknownException(NetworkErrorModel(errorMessage: e.toString(), status: 500));
  }
}
