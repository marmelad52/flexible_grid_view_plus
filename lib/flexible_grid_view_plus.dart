library flexible_grid_view_plus;

export 'src/enums/grid_layout_enum.dart';

import 'package:flexible_grid_view_plus/src/enums/grid_layout_enum.dart';
import 'package:flexible_grid_view_plus/src/layouts/four_column_row_layou.dart';
import 'package:flexible_grid_view_plus/src/layouts/three_column_row_layout.dart';
import 'package:flexible_grid_view_plus/src/layouts/two_column_row_layout.dart';
import 'package:flutter/widgets.dart';

/// A flexible grid view widget that allows for dynamic configuration of the
/// number of columns per row. The grid view is implemented as a [ListView] with
/// a [Row] containing [Flexible] children for each row. The number of columns
/// per row is determined by the [GridLayoutEnum] passed as the `axisCount`
/// parameter. The children widgets can have different heights.
///
/// Example usage:
/// ```
/// FlexibleGridView(
///   children: List.generate(
///     20,
///     (index) => Container(
///       color: Colors.blue,
///       height: 100 + Random().nextInt(100),
///     ),
///   ),
///   axisCount: GridLayoutEnum.threeElementsInRow,
///   crossAxisSpacing: 8,
///   mainAxisSpacing: 8,
/// );
/// ```
class FlexibleGridView extends StatelessWidget {
  /// The number of elements to be displayed in each row.
  final GridLayoutEnum axisCount;

  /// The list of children widgets to be displayed.
  final List<Widget> children;

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

  final CrossAxisAlignment crossAxisAlignment;

  final Widget Function(BuildContext, int)? separatorBuilder;

  const FlexibleGridView({
    super.key,
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
    this.separatorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: shrinkWrap,
      physics: physics,
      controller: controller,
      padding: padding,
      reverse: reverse,
      itemCount: (children.length / axisCount.value).ceil(),
      itemBuilder: (context, index) {
        int startingIndex = index * axisCount.value;
        int endingIndex = (startingIndex + axisCount.value < children.length)
            ? startingIndex + axisCount.value
            : children.length;

        List<Widget> rowChildren = children.sublist(startingIndex, endingIndex);

        switch (axisCount) {
          case GridLayoutEnum.twoElementsInRow:
            return TwoColumnRowLayout(
              crossAxisSpacing: crossAxisSpacing,
              crossAxisAlignment: crossAxisAlignment,
              children: rowChildren,
            );
          case GridLayoutEnum.threeElementsInRow:
            return ThreeColumnRowLayout(
              crossAxisAlignment: crossAxisAlignment,
              crossAxisSpacing: crossAxisSpacing,
              children: rowChildren,
            );
          case GridLayoutEnum.fourElementsInRow:
            return FourColumnRowLayout(
              crossAxisAlignment: crossAxisAlignment,
              crossAxisSpacing: crossAxisSpacing,
              children: rowChildren,
            );
        }
      },
      separatorBuilder: (context, int index) {
        if (separatorBuilder != null) {
          return separatorBuilder!(context, index);
        }

        return SizedBox(height: mainAxisSpacing);
      },
    );
  }
}
