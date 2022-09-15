import 'package:flutter/material.dart';
import 'package:sample_language_app/widgets/neu_container.dart';

class SelectGameAnswerWidget extends StatelessWidget {
  const SelectGameAnswerWidget({
    Key? key,
    required this.selectedAnswer,
  }) : super(key: key);

  final List<String> selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'ANSWER',
          style: TextStyle(letterSpacing: 5),
        ),
        const SizedBox(height: 8),
        NeuContainer(
          alignment: Alignment.center,
          child: Wrap(
            children: [
              for (final word in selectedAnswer) Text('$word '),
            ],
          ),
        ),
      ],
    );
  }
}
