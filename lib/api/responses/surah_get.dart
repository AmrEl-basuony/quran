import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran/api/models/surah.dart';

Future<Surah> fetchSurah(int chapterNumber) async {
  //todo handle network not open
  //todo implement change Quran reading
  final response = await http.get(Uri.parse(
      'https://api.quran.com/api/v4/quran/verses/indopak?chapter_number=$chapterNumber'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Surah.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
