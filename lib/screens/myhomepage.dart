import 'package:flutter/material.dart';
import 'package:quran/screens/indexpage.dart';
import 'package:quran/screens/surahpage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: [IndexPage(), SurahPage()],
        ),
      ),
    );
  }
}
