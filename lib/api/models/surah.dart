import 'dart:convert';
import 'verse.dart';

Surah surahFromJson(String str) => Surah.fromJson(json.decode(str));

String surahToJson(Surah data) => json.encode(data.toJson());

class Surah {
  Surah({
    required this.verses,
  });

  List<Verse> verses;

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        verses: List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "verses": List<dynamic>.from(verses.map((x) => x.toJson())),
      };
}
