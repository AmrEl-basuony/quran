import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran/api/models/index_data.dart';

Future<IndexData> fetchIndexData() async {
  final response =
      await http.get(Uri.parse('https://api.quran.com/api/v4/chapters'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return IndexData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
