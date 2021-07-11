import 'dart:convert';

import 'chapter.dart';

IndexData metaDataFromJson(String str) => IndexData.fromJson(json.decode(str));

String metaDataToJson(IndexData data) => json.encode(data.toJson());

class IndexData {
  IndexData({
    required this.chapters,
  });

  List<Chapter> chapters;

  factory IndexData.fromJson(Map<String, dynamic> json) => IndexData(
        chapters: List<Chapter>.from(
            json["chapters"].map((x) => Chapter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "chapters": List<dynamic>.from(chapters.map((x) => x.toJson())),
      };
}
