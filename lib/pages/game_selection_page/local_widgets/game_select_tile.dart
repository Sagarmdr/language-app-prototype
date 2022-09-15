import 'package:flutter/material.dart';
import 'package:sample_language_app/widgets/app_tile.dart';

class GameSelectTile extends StatelessWidget {
  const GameSelectTile({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppTile(
      onTap: onTap,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            letterSpacing: 5,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
