import 'package:flutter/material.dart';
import 'package:sample_language_app/data/language_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../global_constants.dart';
import 'local_widgets/category_tile.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int highScore = 0;
  void getHighestScore() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      int? temp = prefs.getInt(kHighScoreKey);
      if (temp == null) {
        prefs.setInt(kHighScoreKey, 0);
      }
      highScore = temp ?? 0;
    });
  }

  @override
  void initState() {
    getHighestScore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataHelper = LanguageHelper();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CATEGORY'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
          child: ListView(
            children: [
              CategoryTile(
                title: 'Common Phrases',
                categoryScore: highScore,
                numberOfPhrases: dataHelper.dataMap.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
