import 'package:flutter/material.dart';

class PageViewController extends ChangeNotifier {
  PageController controller = PageController(initialPage: 0);
  PageController get getController => controller;
}
