
# Flexible Grid View Plus

A Flutter package that provides a flexible grid view, making it easier to create grid layouts with dynamic child heights. With Flexible Grid View Plus, you don't have to worry about setting the fixed height or aspect ratio for your children widgets.

## Table of Contents

- [About Flexible Grid View Plus](#about-flexible-grid-view-plus)
  - [Installation](#installation)
  - [Usage](#usage)
    - [Standard Usage](#standard-usage)
    - [Builder Usage](#builder-usage)
  - [API](#api)
  - [Layouts](#layouts)
  - [Conclusion](#conclusion)

## About Flexible Grid View Plus

Flexible Grid View Plus simplifies grid creation in Flutter by allowing children widgets to have any height. This is much more convenient than using the default GridView widget, which often requires setting a fixed height or aspect ratio.

## Installation

Add `flexible_grid_view_plus` as a dependency in your `pubspec.yaml` file:

```dart
dependencies:
  flexible_grid_view_plus: ^1.0.3
```

Then run `flutter pub get` to install the package.

## Usage

### Standard Usage

To use FlexibleGridViewPlus with a pre-built list of widgets, import the package and use the widget as follows:

```dart
import 'package:flexible_grid_view_plus/flexible_grid_view_plus.dart';
import 'dart:math';

FlexibleGridViewPlus(
  children: List.generate(
    20,
    (index) => Container(
      color: Colors.blue,
      height: 100 + Random().nextInt(100).toDouble(),
    ),
  ),
  axisCount: GridLayoutEnum.threeElementsInRow,
  crossAxisSpacing: 8,
  mainAxisSpacing: 8,
);
```

### Builder Usage

The builder constructor works similarly to `ListView.builder` and lets you provide a list of data items along with a builder function that receives the index and the item itself:

```dart
FlexibleGridViewPlus.builder(
  padding: EdgeInsets.fromLTRB(
    16,
    16,
    16,
    MediaQuery.of(context).viewPadding.bottom,
  ),
  axisCount: GridLayoutEnum.twoElementsInRow,
  mainAxisSpacing: 16,
  crossAxisSpacing: 16,
  items: demoData,
  itemBuilder: (context, index, item) {
    return CatalogCard(catalogItem: item);
  },
),
```

## API

The `FlexibleGridViewPlus` widget supports two usage patterns: a standard version with a list of children and a builder version that accepts a list of items of type `T`.

### Common Parameters

- **`axisCount`** (`GridLayoutEnum`):  
  The number of elements to be displayed in each row. Defaults to `GridLayoutEnum.twoElementsInRow`.

- **`crossAxisSpacing`** (`double`):  
  The spacing between columns in the grid. Defaults to `8`.

- **`mainAxisSpacing`** (`double`):  
  The spacing between rows in the grid. Defaults to `8`.

- **`shrinkWrap`** (`bool`):  
  Whether the grid should be allowed to shrink-wrap its contents. Defaults to `false`.

- **`physics`** (`ScrollPhysics?`):  
  The physics for the scrollable grid view. Defaults to `null`.

- **`controller`** (`ScrollController?`):  
  The controller for the scrollable widget. Defaults to `null`.

- **`reverse`** (`bool`):  
  Whether the grid should be displayed in reverse order. Defaults to `false`.

- **`padding`** (`EdgeInsetsGeometry?`):  
  The padding to be applied to the scrollable widget. Defaults to `null`.

- **`crossAxisAlignment`** (`CrossAxisAlignment`):  
  The cross-axis alignment for the children in each row. Defaults to `CrossAxisAlignment.start`.

- **`mainAxisSeparatorBuilder`** (`Widget Function(BuildContext context)?`):  
  A builder for the separator widget between rows. If provided, it will override the default `mainAxisSpacing`.

- **`crossAxisSeparatorBuilder`** (`Widget Function(BuildContext context)?`):  
  A builder for the separator widget between columns. If provided, it will override the default `crossAxisSpacing`.

### Standard Constructor Specific

- **`children`** (`List<Widget>`):  
  A list of widgets to be directly displayed in the grid.

### Builder Constructor Specific

- **`items`** (`List<T>`):  
  A list of elements of type `T` that will be used to lazily build the grid.

- **`itemBuilder`** (`Widget Function(BuildContext context, int index, T item)`):  
  A builder function that receives the build context, the index, and the item of type `T` for that position, and returns the corresponding widget.

## Layouts

The package uses the `GridLayoutEnum` enum to determine the number of elements per row. The enum includes:

- **`GridLayoutEnum.twoElementsInRow`**:  
  Two elements per row.

- **`GridLayoutEnum.threeElementsInRow`**:  
  Three elements per row.

- **`GridLayoutEnum.fourElementsInRow`**:  
  Four elements per row.

Internally, different layout widgets (`TwoColumnRowLayout`, `ThreeColumnRowLayout`, and `FourColumnRowLayout`) are used to arrange grid items based on the selected `axisCount`.

## Conclusion

Flexible Grid View Plus was inspired by the [original package](https://pub.dev/packages/flexible_grid_view) and the work of [egortabula.dev](https://pub.dev/publishers/egortabula.dev/packages). This package aims to simplify the creation of dynamic grids in Flutter by eliminating the need to set fixed heights or aspect ratios for grid items and providing both standard and builder-based usage options.