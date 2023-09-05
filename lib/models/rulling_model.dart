class RullingModel {
  RullingModel({
    this.object,
    this.oracleId,
    this.source,
    this.publishedAt,
    this.comment,
  });

  String? object;
  String? oracleId;
  String? source;
  DateTime? publishedAt;
  String? comment;

  factory RullingModel.fromJson(Map<String, dynamic> json) => RullingModel(
        object: json["object"],
        oracleId: json["oracle_id"],
        source: json["source"],
        publishedAt: json["published_at"] == null ? null : DateTime.parse(json["published_at"]),
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "oracle_id": oracleId,
        "source": source,
        "published_at": publishedAt == null
            ? null
            : "${publishedAt?.year.toString().padLeft(4, '0')}-${publishedAt?.month.toString().padLeft(2, '0')}-${publishedAt?.day.toString().padLeft(2, '0')}",
        "comment": comment,
      };
}
