import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../models/card_model.dart';
import '../../../repositories/scryfall_repository.dart';
import '../../../shared/constants.dart';

part 'card_page_controller.g.dart';

class CardPageController = _CardPageController with _$CardPageController;

abstract class _CardPageController with Store {
  _CardPageController({required this.scryFallRepository});

  final ScryFallRepository scryFallRepository;
  final TextEditingController cardName = TextEditingController();
  final ScrollController scrollController = ScrollController();

  late Either<List<CardModel>, String> resp;

  CardModel? cardSelected;

  @observable
  List<CardModel> cardList = [];

  @observable
  LoadState loadState = LoadState.success;

  @observable
  int timerCount = 2;

  @observable
  bool isSearch = true;

  Timer? timer;

  String errorMsg = '';

  @action
  Future<void> searchCards() async {
    if (isSearch) {
      FocusManager.instance.primaryFocus?.unfocus();
      startCounter();
      changeLoadState(LoadState.loading);
      resp = await scryFallRepository.getCardsList(cardName.text);
      resp.fold(
          (l) => {
                cardList = l,
                changeLoadState(LoadState.success),
                if (cardSelected != null) cardList.removeWhere((e) => e.id == cardSelected?.id)
              },
          (r) => {errorMsg = r, changeLoadState(LoadState.error)});
    }
  }

  @action
  Future<void> getRandomCard() async {
    startCounter();
    changeLoadState(LoadState.loading);
    resp = await scryFallRepository.getRandomCard();
    resp.fold(
        (l) => {
              cardList = l,
              if (cardSelected != null) {cardList.removeWhere((e) => e.id == cardSelected?.id)},
              changeLoadState(LoadState.success),
            },
        (r) => {errorMsg = r, changeLoadState(LoadState.error)});
  }

  @action
  void changeLoadState(LoadState state) {
    loadState = state;
  }

  @action
  void initialState(CardModel? card) {
    changeLoadState(LoadState.loading);
    cardName.text = '';
    cardList = [];
    cardSelected = null;
    if (card != null) {
      cardSelected = card;
    }
    changeLoadState(LoadState.success);
  }

  @action
  void backToTop() {
    scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
  }

  @action
  void clearList() {
    cardName.text = '';
    cardList = [];
  }

  @action
  void startCounter() {
    isSearch = false;
    timer = Timer.periodic(const Duration(milliseconds: 1000), (t) {
      updateCounter();
      if (timerCount == 0) {
        cancelTimer();
      }
    });
  }

  @action
  void updateCounter() {
    timerCount--;
  }

  @action
  void cancelTimer() {
    if (timer != null) {
      timer?.cancel();
      timerCount = 2;
      isSearch = true;
    }
  }
}
