import 'package:flutter/material.dart';

import '../global_constants.dart';

class NeuContainer extends StatelessWidget {
  const NeuContainer({
    Key? key,
    this.height,
    this.width,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.onTap,
    this.shape,
    this.alignment,
  }) : super(key: key);

  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final Color? color;
  final BoxShape? shape;
  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return onTap == null
        ? Container(
            height: height,
            width: width,
            padding: padding,
            margin: margin,
            color: color,
            alignment: alignment,
            decoration: BoxDecoration(
              color: kScaffoldBackgroundColor,
              borderRadius: shape != null ? null : BorderRadius.circular(16),
              shape: shape ?? BoxShape.rectangle,
              boxShadow: const [
                //bottom right is darker
                BoxShadow(
                  color: kNeumorphicShadow,
                  offset: Offset(3, 3),
                  blurRadius: 12,
                  spreadRadius: 3,
                ),

                //top left is lighter
                BoxShadow(
                  color: kNeumorphicLight,
                  offset: Offset(-3, -3),
                  blurRadius: 12,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: child,
          )
        : GestureDetector(
            onTap: onTap,
            child: Container(
              height: height,
              width: width,
              padding: padding,
              margin: margin,
              color: color,
              decoration: BoxDecoration(
                color: kScaffoldBackgroundColor,
                borderRadius: shape != null ? null : BorderRadius.circular(16),
                shape: shape ?? BoxShape.rectangle,
                boxShadow: const [
                  //bottom right is darker
                  BoxShadow(
                    color: kNeumorphicShadow,
                    offset: Offset(3, 3),
                    blurRadius: 12,
                    spreadRadius: 3,
                  ),

                  //top left is lighter
                  BoxShadow(
                    color: kNeumorphicLight,
                    offset: Offset(-3, -3),
                    blurRadius: 12,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: child,
            ),
          );
  }
}
