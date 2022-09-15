import 'package:flutter/material.dart';

import 'neu_container.dart';

class AppTile extends StatelessWidget {
  const AppTile({Key? key, required this.onTap, required this.child})
      : super(key: key);

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: NeuContainer(
        height: 140,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        child: child,
      ),
    );
  }
}
