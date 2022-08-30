import 'package:flutter/material.dart';
import 'package:movie_catalog/main_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Catalog',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFFE87A00),
        ),
      ),
      home: const MainPage(),
    );
  }
}