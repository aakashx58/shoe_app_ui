import 'package:flutter/material.dart';
import 'package:shoes_app_ui/pages/details_page/detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      title: 'Flutter Shoes App UI Tempalte',
      home: const DetailPage(),
    );
  }
}
