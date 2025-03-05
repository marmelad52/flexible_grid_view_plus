// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@protected
class FourColumnRowLayout extends StatelessWidget {
  final List<Widget> children;
  final double crossAxisSpacing;
  final CrossAxisAlignment crossAxisAlignment;
  final Widget Function(BuildContext context)? crossAxisSeparatorBuilder;

  const FourColumnRowLayout({
    Key? key,
    required this.children,
    required this.crossAxisSpacing,
    required this.crossAxisAlignment,
    this.crossAxisSeparatorBuilder,
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
        if (crossAxisSeparatorBuilder != null)
          crossAxisSeparatorBuilder!(context)
        else
          SizedBox(width: crossAxisSpacing),
        Flexible(
          flex: 1,
          child: children.length < 4 ? const SizedBox.shrink() : children[3],
        ),
      ],
    );
  }
}
