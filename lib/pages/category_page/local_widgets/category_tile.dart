import 'package:flutter/material.dart';
import 'package:sample_language_app/pages/game_page/game_page.dart';
import 'package:sample_language_app/widgets/neu_container.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.title,
    required this.numberOfPhrases,
    required this.categoryScore,
  }) : super(key: key);

  final String title;
  final int numberOfPhrases;
  final int categoryScore;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GamePage()),
        );
      },
      child: NeuContainer(
        height: 140,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Text(
                  'TOTAL PHRASES : ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
                Text(
                  numberOfPhrases.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  'CATEGORY HIGH SCORE : ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                  ),
                ),
                Text(
                  categoryScore.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
