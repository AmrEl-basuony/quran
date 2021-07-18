import 'package:flutter/material.dart';
import 'package:quran/api/responses/index_data_get.dart';
import 'package:quran/widgets/custom_card.dart';
import 'package:quran/api/models/index_data.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late Future<IndexData> futureIndexData;

  @override
  void initState() {
    super.initState();
    futureIndexData = fetchIndexData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<IndexData>(
      future: futureIndexData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.chapters.length,
            itemBuilder: (context, index) {
              return CustomCard(
                top1stText: snapshot.data!.chapters[index].id.toString(),
                top2ndText: snapshot.data!.chapters[index].nameComplex,
                top3rdText: snapshot.data!.chapters[index].nameArabic,
                bottom1stText: snapshot.data!.chapters[index].revelationPlace,
                bottom2ndText:
                    snapshot.data!.chapters[index].pages[0].toString() +
                        " : " +
                        snapshot.data!.chapters[index].pages[1].toString(),
                bottom3rdText:
                    snapshot.data!.chapters[index].versesCount.toString(),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
