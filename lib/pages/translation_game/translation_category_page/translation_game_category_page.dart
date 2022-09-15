import 'package:flutter/material.dart';
import 'package:sample_language_app/data/language_helper.dart';
import 'package:sample_language_app/global_constants.dart';
import 'package:sample_language_app/pages/translation_game/translation_game_page/translation_game_page.dart';
import 'package:sample_language_app/widgets/select_game_widgets/select_game_category_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TranslationGameCategoryPage extends StatefulWidget {
  const TranslationGameCategoryPage({Key? key}) : super(key: key);

  @override
  State<TranslationGameCategoryPage> createState() =>
      _TranslationGameCategoryPageState();
}

class _TranslationGameCategoryPageState
    extends State<TranslationGameCategoryPage> {
  int highScore = 0;
  void getHighestScore() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      int? temp = prefs.getInt(kHighScoreKeyTranslationGame);
      if (temp == null) {
        prefs.setInt(kHighScoreKeyTranslationGame, 0);
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
          title: const Text('TRANSLATION'),
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
                      builder: (context) => const TranslationGamePage(),
                    ),
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
