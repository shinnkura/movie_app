import 'package:dio/dio.dart';

class MoviesException implements Exception {
  MoviesException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      // ignore: deprecated_member_use
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      // ignore: deprecated_member_use
      case DioErrorType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      // ignore: deprecated_member_use
      case DioErrorType.unknown:
        message = "Connection to API server failed due to internet connection";
        break;
      // ignore: deprecated_member_use
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      // ignore: deprecated_member_use
      case DioErrorType.badResponse:
        message = _handleError(dioError.response!.statusCode);
        break;
      // ignore: deprecated_member_use
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String? message;

  String _handleError(statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return 'The requested resource was not found';
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message.toString();
}
