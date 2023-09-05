import 'image_uri_model.dart';

class CardModel {
  String? id;
  String? name;
  ImageUris? imageUris;
  String? rulingsUri;
  String? artist;
  String? setName;
  String? manaCost;
  double? cmc;
  String? typeLine;
  String? oracleText;

  CardModel({this.id,
    this.name,
    this.imageUris,
    this.artist,
    this.rulingsUri,
    this.setName,
    this.cmc,
    this.manaCost,
    this.typeLine,
    this.oracleText});

  @override
  String toString() {
    return 'id: $id, name: $name, artist: $artist, setName: $setName, cmc: $cmc, oracleText: $oracleText, imageUris: $imageUris';
  }

  CardModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json['name'],
        imageUris = json["image_uris"] == null ? null : ImageUris.fromJson(json["image_uris"]),
        artist = json['artist'],
        rulingsUri = json["rulings_uri"],
        setName = json['set_name'],
        manaCost = json["mana_cost"],
        cmc = json["cmc"],
        typeLine = json["type_line"],
        oracleText = json["oracle_text"];

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "artist": artist,
        "image_uris": imageUris?.toJson()
      };
}
