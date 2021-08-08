import 'package:flutter/material.dart';

class SurahIndex extends ChangeNotifier {
  int index = 1;

  int get getIndex => index;

  void setIndex(newIndex) {
    index = newIndex + 1;
    notifyListeners();
  }
}
