import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class FavorateModelView extends ChangeNotifier {
    
    bool showFullText = false;
    IconData icon = IconlyLight.heart;
    int _counter = 1; 
    int get counter => _counter;

//حق القلب يوم ينقلب حمر
  void toggleButtonColor() {
    icon = icon == IconlyLight.heart ? IconlyBold.heart : IconlyLight.heart;
    notifyListeners(); 
  }

//حق الهذوة يوم تمتط
  void toggleShowFullText() {
    showFullText = !showFullText;
    notifyListeners(); 
  }


  void incrementCounter() {
    if (_counter < 10) {
      _counter++;
      notifyListeners();
    }
  }

  void decrementCounter() {
    if (_counter > 1) {
      _counter--;
      notifyListeners();
    }
  }
}


