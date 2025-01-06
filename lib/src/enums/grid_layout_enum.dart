/// An enum representing the number of elements to be displayed in a single row of a grid layout.
enum GridLayoutEnum {
  /// Two elements will be displayed in each row.
  twoElementsInRow(2),

  /// Three elements will be displayed in each row.
  threeElementsInRow(3),

  /// Four elements will be displayed in each row.
  fourElementsInRow(4);

  /// The value of this enum member.
  final int value;

  /// Creates a new instance of the `GridLayoutEnum` enum.
  ///
  /// The `value` parameter specifies the value of the enum member.
  const GridLayoutEnum(this.value);
}
