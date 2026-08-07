import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            'Connection to the server timed out. Check your internet connection.');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Failed to send data. Please try again.');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Failed to receive data. Please try again.');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response?.statusCode, dioError.response?.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request was cancelled. Please try again.');

      case DioExceptionType.unknown:
        return ServerFailure('No internet connection. Check your network.');

      default:
        return ServerFailure('An unexpected error occurred. Please try again.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 422) {
      return ServerFailure(
          'Invalid input data. Please check and try again.');
    } else if (statusCode == 404) {
      return ServerFailure('The requested page or resource was not found.');
    } else if (statusCode == 409) {
      return ServerFailure('This email is already in use.');
    } else if (statusCode == 500) {
      return ServerFailure('Server error. Please try again later.');
    } else {
      return ServerFailure('An unexpected error occurred. Please try again.');
    }
  }
}
