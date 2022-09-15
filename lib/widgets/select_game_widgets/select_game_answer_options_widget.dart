import 'package:flutter/material.dart';

class SelectGameAnswerOptionsWdiget extends StatelessWidget {
  const SelectGameAnswerOptionsWdiget(
      {Key? key, required this.showingOptions, required this.onChipPressed})
      : super(key: key);

  final List<String> showingOptions;
  final Function(String) onChipPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Wrap(
        spacing: 8,
        runSpacing: 12,
        children: [
          for (final option in showingOptions)
            ActionChip(
              label: Text(option),
              labelPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              onPressed: onChipPressed(option),
            ),
        ],
      ),
    );
  }
}
