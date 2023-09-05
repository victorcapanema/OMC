import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../funcionalities/life_counter/views/life_counter_page.dart';
import '../models/card_model.dart';
import '../models/image_uri_model.dart';
import '../widgets/custom_svg.dart';

enum LoadState {
  loading,
  success,
  error,
}

int globalNumPlayers = 2;
int globalLifePoints = 20;
int usedIndex = 0;

List<LifeCounterPage> listCounters = [
  Modular.get<LifeCounterPage>(),
  Modular.get<LifeCounterPage>(),
  Modular.get<LifeCounterPage>(),
  Modular.get<LifeCounterPage>(),
  Modular.get<LifeCounterPage>(),
  Modular.get<LifeCounterPage>()
];

List<Widget> manaSymbols = [
  CSvg("images/instant.svg", color: Colors.white),
  CSvg("images/w.svg", color: Colors.amberAccent),
  CSvg("images/u.svg", color: Colors.blue),
  CSvg("images/b.svg", color: Colors.black),
  CSvg("images/r.svg", color: Colors.red),
  CSvg("images/g.svg", color: Colors.green),
  CSvg("images/c.svg", color: Colors.grey),
];

CardModel auxCard = CardModel(
    id: '0b168b85-323c-4d95-80a5-851988522606',
    name: 'Fblthp, the Lost, artist: Marija Tiurina',
    imageUris: ImageUris(
        artCrop: 'https://cards.scryfall.io/art_crop/front/0/b/0b168b85-323c-4d95-80a5-851988522606.jpg?1682690689'));

