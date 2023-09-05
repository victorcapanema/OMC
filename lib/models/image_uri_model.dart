class ImageUris {
  ImageUris({
    this.small,
    this.artCrop,
  });

  String? small;
  String? artCrop;

  @override
  String toString() {
    return 'artCrop: $artCrop, small: $small';
  }

  factory ImageUris.fromJson(Map<String, dynamic> json) => ImageUris(
        small: json["small"],
        artCrop: json["art_crop"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "art_crop": artCrop,
      };
}
