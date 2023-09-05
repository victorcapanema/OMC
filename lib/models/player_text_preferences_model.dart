class PLayerTextPreferences {
  String textColor;
  double contrastValue;
  double fontSizeLife;
  double fontSizeIcons;

  PLayerTextPreferences(
      {required this.textColor, required this.contrastValue, required this.fontSizeLife, required this.fontSizeIcons});

  Map<String, dynamic> toJson() => {
    "textColor": textColor,
    "contrastValue": contrastValue,
    "fontSizeLife": fontSizeLife,
    "fontSizeIcons": fontSizeIcons,
  };

  PLayerTextPreferences.fromJson(Map<String, dynamic> json)
      : textColor = json["textColor"],
        contrastValue = json['contrastValue'],
        fontSizeLife = json['fontSizeLife'],
        fontSizeIcons = json["fontSizeIcons"];
}
