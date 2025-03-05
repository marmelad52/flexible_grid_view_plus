import 'package:flutter/material.dart';

class TwoColumnRowLayout extends StatelessWidget {
  final List<Widget> children;
  final double crossAxisSpacing;
  final Widget Function(BuildContext context)? crossAxisSeparatorBuilder;
  final CrossAxisAlignment crossAxisAlignment;

  const TwoColumnRowLayout({
    Key? key,
    required this.crossAxisSpacing,
    this.crossAxisSeparatorBuilder,
    required this.children,
    required this.crossAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Flexible(
          flex: 1,
          child: children[0],
        ),
        if (crossAxisSeparatorBuilder != null)
          crossAxisSeparatorBuilder!(context)
        else
          SizedBox(width: crossAxisSpacing),
        Flexible(
          flex: 1,
          child: children.length == 1 ? const SizedBox.shrink() : children[1],
        ),
      ],
    );
  }
}
