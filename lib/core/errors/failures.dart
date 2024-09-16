import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMsg;

  Failure({required this.errorMsg});
}



class ServerFailure extends Failure {
  ServerFailure({required super.errorMsg});

  factory ServerFailure.DioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMsg: 'Connection timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMsg: 'Send timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMsg: 'Receive timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMsg: 'Bad certificate');
      case DioExceptionType.badResponse:
        return dioException.response != null
            ? ServerFailure.fromResponse(
          dioException.response!.statusCode ?? 0,
          dioException.response!.data,
        )
            : ServerFailure(errorMsg: 'Bad response with no data');
      case DioExceptionType.cancel:
        return ServerFailure(errorMsg: 'Operation canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMsg: 'Connection error');
      case DioExceptionType.unknown:
        if (dioException.message != null &&
            dioException.message!.contains('Socket Exception')) {
          return ServerFailure(errorMsg: 'No internet connection');
        } else {
          return ServerFailure(
              errorMsg: 'Unexpected error, please try again later');
        }
      default:
        return ServerFailure(
            errorMsg: 'Oops, there was an error, please try again later');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMsg: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errorMsg: 'Your request was not found, please try again later');
    } else if (statusCode == 500) {
      return ServerFailure(
          errorMsg: 'Internal server error, please try again later');
    } else {
      return ServerFailure(
          errorMsg: 'Oops, there was an error, please try again later');
    }
  }
}
