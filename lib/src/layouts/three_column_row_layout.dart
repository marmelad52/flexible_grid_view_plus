import 'package:flutter/material.dart';

class ThreeColumnRowLayout extends StatelessWidget {
  final List<Widget> children;
  final double crossAxisSpacing;
  final CrossAxisAlignment crossAxisAlignment;
  final Widget Function(BuildContext context)? crossAxisSeparatorBuilder;

  const ThreeColumnRowLayout({
    super.key,
    required this.children,
    required this.crossAxisSpacing,
    required this.crossAxisAlignment,
    this.crossAxisSeparatorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    // IntrinsicHeight makes the row match the tallest child, so crossAxisAlignment.stretch can equalize heights.
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Flexible(flex: 1, child: children[0]),
          if (crossAxisSeparatorBuilder != null)
            crossAxisSeparatorBuilder!(context)
          else
            SizedBox(width: crossAxisSpacing),
          Flexible(
            flex: 1,
            child: children.length < 2 ? const SizedBox.shrink() : children[1],
          ),
          if (crossAxisSeparatorBuilder != null)
            crossAxisSeparatorBuilder!(context)
          else
            SizedBox(width: crossAxisSpacing),
          Flexible(
            flex: 1,
            child: children.length < 3 ? const SizedBox.shrink() : children[2],
          ),
        ],
      ),
    );
  }
}
