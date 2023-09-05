import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DioService {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.scryfall.com'));
  late String mode;
  late Map<String, dynamic> queryParams;

  DioService();

  Future<Either<dynamic, String>> request(String url, String mode,
      {dynamic data, Map<String, dynamic>? queryParams}) async {
    try {
      return Left(await dio.request(url, data: data, queryParameters: queryParams, options: Options(method: mode)));
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return const Right('Connection ended, try again.');
        case DioExceptionType.badResponse:
          switch (e.response?.statusCode) {
            case 400:
              return const Right('Bad Request.');
            case 401:
              return const Right('Unauthorized.');
            case 404:
              return const Right('Not Found.');
            case 409:
              return const Right('Conflict.');
            case 500:
              return const Right('Internal Server Error.');
            default:
              return const Right('Unexpected Error.');
          }
        case DioExceptionType.cancel:
          return const Right('Request Canceled.');
        default:
          return const Right('No connection.');
      }
    }
  }
}
