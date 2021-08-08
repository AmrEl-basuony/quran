import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/api/models/page_view_controller.dart';
import 'package:quran/api/models/surah_index.dart';
import 'package:quran/screens/indexpage.dart';
import 'package:quran/screens/surahpage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    PageController controller =
        Provider.of<PageViewController>(context, listen: false).getController;
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => SurahIndex(),
        child: SafeArea(
          child: PageView(
            controller: controller,
            children: [IndexPage(), SurahPage()],
          ),
        ),
      ),
    );
  }
}
