import 'package:flutter/material.dart';
import 'package:sample_language_app/pages/word_selection_game/word_selection_category_page/word_selection_category_page.dart';

import 'global_constants.dart';

final GlobalKey<ScaffoldMessengerState> kScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language App Prototype',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: kScaffoldMessengerKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kScaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: 4,
          ),
        ),
      ),
      home: const CategoryPage(),
    );
  }
}
