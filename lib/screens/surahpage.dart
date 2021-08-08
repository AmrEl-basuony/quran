import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/api/models/surah.dart';
import 'package:quran/api/models/surah_index.dart';
import 'package:quran/api/responses/surah_get.dart';

class SurahPage extends StatefulWidget {
  SurahPage({Key? key}) : super(key: key);

  @override
  _SurahPageState createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  late Future<Surah> futureSurah;
  var ayahNumber = 0;
  final textStyle = const TextStyle(fontSize: 18);
  late int index;

  @override
  void initState() {
    super.initState();
    index = Provider.of<SurahIndex>(context, listen: false).getIndex;
    futureSurah = fetchSurah(index);
  }

  @override
  Widget build(BuildContext context) {
    //todo does't redraw
    return Consumer<SurahIndex>(builder: (context, data, child) {
      futureSurah = fetchSurah(data.getIndex);
      return FutureBuilder<Surah>(
        future: futureSurah,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectableText.rich(
                TextSpan(text: " ", children: <InlineSpan>[
                  for (var ayah in snapshot.data!.verses)
                    TextSpan(
                        text:
                            "${ayah.text} ${replaceFarsiNumber(ayah.verseKey)} ")
                ]),
                textDirection: TextDirection.rtl,
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        },
      );
    });
  }
}

String replaceFarsiNumber(String input) {
  input = input.substring(input.indexOf(":") + 1);
  input.trim();
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], farsi[i]);
  }
  return input;
}
