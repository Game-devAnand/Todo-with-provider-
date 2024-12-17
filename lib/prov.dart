import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;  // Getter for _count

  void add() {
    _count++;
    notifyListeners();  // Notify listeners when count changes
  }

  void sub() {
    _count--;
    notifyListeners();  // Notify listeners when count changes
  }
}
