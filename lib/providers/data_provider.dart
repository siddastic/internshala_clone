import 'package:flutter/material.dart' show ChangeNotifier;

class DataProvider extends ChangeNotifier {
  final List _internships = [];
  bool _isLoaded = false;

  List get internships => _internships;
  bool get isLoaded => _isLoaded;

  void load() {}
}
