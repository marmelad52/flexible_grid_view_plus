import 'package:flutter/material.dart';

class TwoColumnRowLayout extends StatelessWidget {
  final List<Widget> children;
  final double crossAxisSpacing;
  final Widget Function(BuildContext context)? crossAxisSeparatorBuilder;
  final CrossAxisAlignment crossAxisAlignment;

  const TwoColumnRowLayout({
    super.key,
    required this.crossAxisSpacing,
    required this.children,
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
            child: children.length == 1
                ? const SizedBox.shrink()
                : children[1],
          ),
        ],
      ),
    );
  }
}
