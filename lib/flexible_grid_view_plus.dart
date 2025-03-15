library flexible_grid_view_plus;

export 'src/enums/grid_layout_enum.dart';

import 'package:flexible_grid_view_plus/src/enums/grid_layout_enum.dart';
import 'package:flexible_grid_view_plus/src/layouts/four_column_row_layou.dart';
import 'package:flexible_grid_view_plus/src/layouts/three_column_row_layout.dart';
import 'package:flexible_grid_view_plus/src/layouts/two_column_row_layout.dart';
import 'package:flutter/widgets.dart';

class FlexibleGridViewPlus<T> extends StatelessWidget {
  /// The number of elements to be displayed in each row.
  final GridLayoutEnum axisCount;

  /// The list of children widgets to be displayed.
  final List<Widget>? children;

  /// The spacing between columns in the grid.
  final double crossAxisSpacing;

  /// The spacing between rows in the grid.
  final double mainAxisSpacing;

  /// Whether the grid should be allowed to shrink-wrap its contents.
  final bool shrinkWrap;

  /// The physics of the scrollable widget.
  final ScrollPhysics? physics;

  /// The controller for the scrollable widget.
  final ScrollController? controller;

  /// Whether the grid should be displayed in reverse order.
  final bool reverse;

  /// The padding to be applied to the scrollable widget.
  final EdgeInsetsGeometry? padding;

  /// crossAxisAlignment in row in the grid
  final CrossAxisAlignment crossAxisAlignment;

  /// The separator builder between rows in the grid.
  ///
  /// if this function is not null, it will be used instead of mainAxisSpacing.
  final Widget Function(BuildContext context)? mainAxisSeparatorBuilder;

  /// The separator builder between columns in the grid.
  ///
  /// if this function is not null, it will be used instead of crossAxisSpacing.
  final Widget Function(BuildContext context)? crossAxisSeparatorBuilder;

  /// A list of elements to build using the builder.
  final List<T>? items;

  /// The builder function that gets the context, the index, and the element itself.
  final Widget Function(BuildContext context, int index, T item)? itemBuilder;

  /// Constructor for a ready-made list of children.
  const FlexibleGridViewPlus({
    Key? key,
    required this.children,
    this.axisCount = GridLayoutEnum.twoElementsInRow,
    this.crossAxisSpacing = 8,
    this.mainAxisSpacing = 8,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.shrinkWrap = false,
    this.physics,
    this.controller,
    this.padding,
    this.reverse = false,
    this.mainAxisSeparatorBuilder,
    this.crossAxisSeparatorBuilder,
  })  : items = null,
        itemBuilder = null,
        super(key: key);

  /// A named constructor with a builder pattern that accepts a list of type T elements.
  const FlexibleGridViewPlus.builder({
    Key? key,
    required List<T> this.items,
    required Widget Function(BuildContext context, int index, T item)
        this.itemBuilder,
    this.axisCount = GridLayoutEnum.twoElementsInRow,
    this.crossAxisSpacing = 8,
    this.mainAxisSpacing = 8,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.shrinkWrap = false,
    this.physics,
    this.controller,
    this.padding,
    this.reverse = false,
    this.mainAxisSeparatorBuilder,
    this.crossAxisSeparatorBuilder,
  })  : children = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (children != null) {
      return ListView.separated(
        shrinkWrap: shrinkWrap,
        physics: physics,
        controller: controller,
        padding: padding,
        reverse: reverse,
        itemCount: (children!.length / axisCount.value).ceil(),
        itemBuilder: (context, rowIndex) {
          final startIndex = rowIndex * axisCount.value;
          final endIndex = (startIndex + axisCount.value < children!.length)
              ? startIndex + axisCount.value
              : children!.length;
          final rowChildren = children!.sublist(startIndex, endIndex);

          switch (axisCount) {
            case GridLayoutEnum.twoElementsInRow:
              return TwoColumnRowLayout(
                crossAxisSpacing: crossAxisSpacing,
                crossAxisAlignment: crossAxisAlignment,
                crossAxisSeparatorBuilder: crossAxisSeparatorBuilder,
                children: rowChildren,
              );
            case GridLayoutEnum.threeElementsInRow:
              return ThreeColumnRowLayout(
                crossAxisSpacing: crossAxisSpacing,
                crossAxisAlignment: crossAxisAlignment,
                crossAxisSeparatorBuilder: crossAxisSeparatorBuilder,
                children: rowChildren,
              );
            case GridLayoutEnum.fourElementsInRow:
              return FourColumnRowLayout(
                crossAxisSpacing: crossAxisSpacing,
                crossAxisAlignment: crossAxisAlignment,
                crossAxisSeparatorBuilder: crossAxisSeparatorBuilder,
                children: rowChildren,
              );
          }
        },
        separatorBuilder: (context, index) => mainAxisSeparatorBuilder != null
            ? mainAxisSeparatorBuilder!(context)
            : SizedBox(height: mainAxisSpacing),
      );
    } else {
      // Implementation for the builder pattern with the transfer of a type T element.
      final rowCount = (items!.length / axisCount.value).ceil();
      return ListView.separated(
        shrinkWrap: shrinkWrap,
        physics: physics,
        controller: controller,
        padding: padding,
        reverse: reverse,
        itemCount: rowCount,
        itemBuilder: (context, rowIndex) {
          final startIndex = rowIndex * axisCount.value;
          final endIndex = (startIndex + axisCount.value > items!.length)
              ? items!.length
              : startIndex + axisCount.value;
          final rowChildren = List.generate(
            endIndex - startIndex,
            (index) => itemBuilder!(
                context, startIndex + index, items![startIndex + index]),
          );

          switch (axisCount) {
            case GridLayoutEnum.twoElementsInRow:
              return TwoColumnRowLayout(
                crossAxisSpacing: crossAxisSpacing,
                crossAxisAlignment: crossAxisAlignment,
                crossAxisSeparatorBuilder: crossAxisSeparatorBuilder,
                children: rowChildren,
              );
            case GridLayoutEnum.threeElementsInRow:
              return ThreeColumnRowLayout(
                crossAxisSpacing: crossAxisSpacing,
                crossAxisAlignment: crossAxisAlignment,
                crossAxisSeparatorBuilder: crossAxisSeparatorBuilder,
                children: rowChildren,
              );
            case GridLayoutEnum.fourElementsInRow:
              return FourColumnRowLayout(
                crossAxisSpacing: crossAxisSpacing,
                crossAxisAlignment: crossAxisAlignment,
                crossAxisSeparatorBuilder: crossAxisSeparatorBuilder,
                children: rowChildren,
              );
          }
        },
        separatorBuilder: (context, index) => mainAxisSeparatorBuilder != null
            ? mainAxisSeparatorBuilder!(context)
            : SizedBox(height: mainAxisSpacing),
      );
    }
  }
}
