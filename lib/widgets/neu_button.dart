import 'package:flutter/material.dart';

import 'neu_container.dart';

class NeuButton extends StatelessWidget {
  const NeuButton({
    Key? key,
    required this.iconData,
    required this.onTap,
    this.tooltip,
  }) : super(key: key);

  final IconData iconData;
  final VoidCallback onTap;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: NeuContainer(
        padding: const EdgeInsets.all(20),
        shape: BoxShape.circle,
        onTap: onTap,
        child: Icon(
          iconData,
          size: 30,
        ),
      ),
    );
  }
}
