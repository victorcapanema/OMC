import 'package:dartz/dartz.dart';
import 'package:life_counter/models/rulling_model.dart';
import '../models/card_model.dart';
import '../services/dio_service.dart';

class ScryFallRepository {
  ScryFallRepository({required this.dio});

  final DioService dio;

  late Either<dynamic, String> response;
  late CardModel cardModel;
  late RullingModel rullingModel;

  List<CardModel> cardList = [];
  List<RullingModel> rullingList = [];

  Future<Either<List<CardModel>, String>> getCardsList(String cardName) async {
    response = await dio.request('/cards/search', 'GET', queryParams: {'q': cardName, 'unique': 'art'});
    return response.fold(
        (l) => Left(l.data['data'].map<CardModel>((item) => CardModel.fromJson(item)).toList()), (r) => Right(r));
  }

  Future<Either<List<RullingModel>, String>> getCardRulling(String cardId) async {
    response = await dio.request('/cards/$cardId/rulings', 'GET');
    return response.fold(
        (l) => Left(l.data['data'].map<RullingModel>((item) => RullingModel.fromJson(item)).toList()), (r) => Right(r));
  }

  Future<Either<List<CardModel>, String>> getRandomCard() async {
    response = await dio.request('/cards/random', 'GET', queryParams: {'unique': 'art'});
    return response.fold((l) => Left([CardModel.fromJson(l.data)]), (r) => Right(r));
  }
}
