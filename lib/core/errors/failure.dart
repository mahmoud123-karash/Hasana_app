// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
  factory ServerFailure.FromDioErorr(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with api server');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioErrorType.badCertificate:
        return ServerFailure('badCertificate with api server');
      case DioErrorType.badResponse:
        return ServerFailure.FromBadResponse(
            e.response!.statusCode, e.response);
      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioErrorType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioErrorType.unknown:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.FromBadResponse(int? statuscode, dynamic response) {
    if (statuscode == 404) {
      return ServerFailure('Your request was not found, please try later');
    } else if (statuscode == 500) {
      return ServerFailure('There is a problem with server, please try later');
    } else if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('There was an error , please try again');
    }
  }
}

class HiveError extends Failure {
  HiveError(String message) : super(message);

  factory HiveError.FromHiveErorr(HiveError e) {
    return e;
  }
}
