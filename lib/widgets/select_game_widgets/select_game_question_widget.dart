import 'package:flutter/material.dart';

class SelectGameQuestionWidget extends StatelessWidget {
  const SelectGameQuestionWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  final String question;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          question,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
