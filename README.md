![](https://img.shields.io/github/stars/egortabula/flexible_grid_view?style=social) ![](https://img.shields.io/github/checks-status/egortabula/flexible_grid_view/main) ![](https://img.shields.io/badge/Support-Android%20%7C%20IOS%20%7C%20Mac%20%7C%20Windows%20%7C%20Linux%20%7C%20Web-brightgreen)
![](https://i.ibb.co/jbbncPc/flexible-grid-view-flutter-package-egor-tabula.jpg)


- [About Flexible grid view](#about-flexible-grid-view)
  - [Installation](#installation)
  - [Usage](#usage)
  - [API](#api)
  - [Layouts](#layouts)
  - [Conclusion](#conclusion)

# About Flexible grid view
I made Flexible Grid View that makes it easier to create grid views in Flutter.

With Flexible Grid View, you don't have to worry about setting the height of your children widgets because they can have any height. This is much more convenient than the default gridView widget, which requires you to set either the aspectRatio or a fixed height for your children widgets.

## Installation
Add `flexible_grid_view` as a dependency in your pubspec.yaml file:

```dart
dependencies:
  flexible_grid_view: ^0.0.1
```

Then, run `flutter pub get` to install the package.
## Usage
To use FlexibleGridView, import flexible_grid_view.dart and use the FlexibleGridView widget as follows:

```dart
import 'package:flexible_grid_view/flexible_grid_view.dart';
import 'dart:math';

FlexibleGridView(
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
Here, we have created a `FlexibleGridView` with 20 randomly sized Container children, displayed in rows with three elements per row, with 8 pixels of spacing between columns and rows.

## API

The `FlexibleGridView` widget has the following parameters:

- `children` (required): The list of children widgets to be displayed.
- `axisCount`: The number of elements to be displayed in each row, as a GridLayoutEnum value. Defaults to GridLayoutEnum.twoElementsInRow.
- `crossAxisSpacing`: The spacing between columns in the grid. Defaults to 8.
- `mainAxisSpacing`: The spacing between rows in the grid. Defaults to 8.
- `shrinkWrap`: Whether the grid should be allowed to shrink-wrap its contents. Defaults to false.
- `physics`: The physics of the scrollable widget. Defaults to null.
- `controller`: The controller for the scrollable widget. Defaults to null.
- `reverse`: Whether the grid should be displayed in reverse order. Defaults to false.
- `padding`: The padding to be applied to the scrollable widget. Defaults to null.

## Layouts
`GridLayoutEnum` is an enum class that represents the number of elements to be displayed in each row of the `FlexibleGridView`. It has the following values:

* `GridLayoutEnum.twoElementsInRow`: Two elements per row.
* `GridLayoutEnum.threeElementsInRow`: Three elements per row.
* `GridLayoutEnum.fourElementsInRow`: Four elements per row.


## Conclusion
Thank you for watching until the end! I hope I was able to explain how this package works. But if you still have any questions, you can write to me on [Telegram](https://t.me/egor_tabula) or [GitHub](https://github.com/egortabula/shopping_cart), and I will try to help as much as possible.

[![Buy me a coffe](https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png "Buy me a coffe")](https://www.buymeacoffee.com/egortabula "Buy me a coffe")
