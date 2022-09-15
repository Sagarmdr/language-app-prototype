import 'package:flutter/material.dart';

class SelectGameAnswerStreakWidget extends StatelessWidget {
  const SelectGameAnswerStreakWidget({
    Key? key,
    required this.correctAnswerStreak,
  }) : super(key: key);

  final int correctAnswerStreak;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Correct Answer Streak : $correctAnswerStreak',
      style: const TextStyle(
        fontSize: 16,
        letterSpacing: 3,
      ),
    );
  }
}
