import 'package:anim_search_bar/anim_search_bar.dart';
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

  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<IndexData>(
          future: futureIndexData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.chapters.length,
                itemBuilder: (context, index) {
                  return Text(snapshot.data!.chapters[index].nameSimple);
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
        AnimSearchBar(
            textController: textController,
            rtl: true,
            width: MediaQuery.of(context).size.width,
            onSuffixTap: () {
              setState(() {
                textController.clear();
              });
            }),
      ],
    );
  }
}
