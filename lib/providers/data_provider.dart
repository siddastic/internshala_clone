import 'dart:convert';

import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:http/http.dart';
import 'package:internshala_search/models/internship.dart';

class DataProvider extends ChangeNotifier {
  final List<Internship> _internships = [];
  bool _isLoaded = false;

  List get internships => _internships;
  bool get isLoaded => _isLoaded;

  void load() async {
    _internships.clear();
    // intentional delay to show the shimmer effect
    await Future.delayed(const Duration(seconds: 1));
    var response = await get(Uri(
      scheme: 'https',
      host: 'internshala.com',
      path: '/flutter_hiring/search',
    ));
    if (response.statusCode == 200) {
      var data = response.body;
      var json = jsonDecode(data);
      (json['internships_meta'] as Map).forEach((key, value) {
        _internships.add(Internship.fromJson(value));
      });

      _isLoaded = true;
    }
    notifyListeners();
  }
}
