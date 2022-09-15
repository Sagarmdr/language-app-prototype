import 'package:flutter/material.dart';
import 'package:sample_language_app/pages/game_selection_page/local_widgets/game_select_tile.dart';
import 'package:sample_language_app/pages/translation_game/translation_category_page/translation_game_category_page.dart';
import 'package:sample_language_app/pages/word_selection_game/word_selection_category_page/word_selection_category_page.dart';

class GameSelectionPage extends StatelessWidget {
  const GameSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GAMES'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
          child: ListView(
            children: [
              GameSelectTile(
                text: 'Word Selection',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WordSelectionCategoryPage(),
                    ),
                  );
                },
              ),
              GameSelectTile(
                text: 'Translation',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TranslationGameCategoryPage(),
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
