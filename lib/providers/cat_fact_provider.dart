// lib/providers/cat_fact_provider.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/cat_fact.dart';

class CatFactProvider with ChangeNotifier {
  List<CatFact> _catFacts = [];

  List<CatFact> get catFacts => _catFacts;

  Future<void> fetchCatFacts() async {
    final response = await http.get(Uri.parse('https://catfact.ninja/facts'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _catFacts =
          (data['data'] as List).map((json) => CatFact.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load cat facts');
    }
  }
}
