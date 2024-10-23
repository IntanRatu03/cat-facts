// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cat_fact_provider.dart';
import 'pages/cat_facts_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => CatFactProvider()),
      ],
      child: MaterialApp(
        title: 'Cat Facts App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CatFactsPage(),
      ),
    );
  }
}
