import 'package:flutter/material.dart';
import 'package:sample_language_app/data/language_helper.dart';
import 'package:sample_language_app/global_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../word_selection_game_page/word_selection_game_page.dart';
import '../../../widgets/select_game_widgets/select_game_category_tile.dart';

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
      int? temp = prefs.getInt(kHighScoreKeyWordSelectionGame);
      if (temp == null) {
        prefs.setInt(kHighScoreKeyWordSelectionGame, 0);
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
              SelectGameCategoryTile(
                title: 'Common Phrases',
                categoryScore: highScore,
                numberOfPhrases: dataHelper.dataMap.length,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WordSelectionGamePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
