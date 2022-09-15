import 'package:flutter/material.dart';
import 'package:sample_language_app/widgets/neu_button.dart';

class SelectGameOptionButtons extends StatelessWidget {
  const SelectGameOptionButtons(
      {Key? key,
      required this.onNext,
      required this.onClear,
      required this.onCheck})
      : super(key: key);

  final VoidCallback onNext;
  final VoidCallback onClear;
  final VoidCallback onCheck;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NeuButton(
          iconData: Icons.navigate_next,
          tooltip: 'Next Phrase',
          onTap: onNext,
        ),
        NeuButton(
          iconData: Icons.refresh,
          tooltip: 'Clear Answer',
          onTap: onClear,
        ),
        NeuButton(
          iconData: Icons.check,
          tooltip: 'Check Answer',
          onTap: onCheck,
        ),
      ],
    );
  }
}
