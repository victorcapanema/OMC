import 'package:dartz/dartz.dart';
import 'package:life_counter/models/rulling_model.dart';
import 'package:mobx/mobx.dart';
import '../../../models/card_model.dart';
import '../../../repositories/scryfall_repository.dart';

part 'gatherer_page_controller.g.dart';

class GathererPageController = _GathererPageController with _$GathererPageController;

abstract class _GathererPageController with Store {
  _GathererPageController({required this.scryFallRepository});

  late Either<List<RullingModel>, String> resp;
  final ScryFallRepository scryFallRepository;

  String errorMsg = '';
  CardModel? card;

  @observable
  List<RullingModel> rullingList = [];

  @action
  Future<void> getRullings() async {
    resp = await scryFallRepository.getCardRulling(card!.id!);
    resp.fold((l) => rullingList = l, (r) => errorMsg = r);
  }
}
