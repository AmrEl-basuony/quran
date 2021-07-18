class Verse {
  Verse({
    required this.id,
    required this.verseKey,
    required this.text,
  });

  int id;
  String verseKey;
  String text;

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        id: json["id"],
        verseKey: json["verse_key"],
        text: json["text_indopak"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "verse_key": verseKey,
        "text": text,
      };
}
