import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/api/models/page_view_controller.dart';

import 'screens/myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: ChangeNotifierProvider(
          create: (context) => PageViewController(), child: MyHomePage()),
    );
  }
}
