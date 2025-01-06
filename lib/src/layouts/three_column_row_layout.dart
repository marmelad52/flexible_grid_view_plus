// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ThreeColumnRowLayout extends StatelessWidget {
  final List<Widget> children;
  final double crossAxisSpacing;
  final CrossAxisAlignment crossAxisAlignment;

  const ThreeColumnRowLayout({
    Key? key,
    required this.children,
    required this.crossAxisSpacing,
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
        SizedBox(width: crossAxisSpacing),
        Flexible(
          flex: 1,
          child: children.length < 2 ? const SizedBox.shrink() : children[1],
        ),
        SizedBox(width: crossAxisSpacing),
        Flexible(
          flex: 1,
          child: children.length < 3 ? const SizedBox.shrink() : children[2],
        ),
      ],
    );
  }
}
