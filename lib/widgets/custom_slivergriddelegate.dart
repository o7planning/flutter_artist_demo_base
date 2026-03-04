import 'package:flutter/rendering.dart';

class ChildFixedMainExtentAndMinCrossExtentSGD extends SliverGridDelegate {
  const ChildFixedMainExtentAndMinCrossExtentSGD({
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    required this.minChildCrossAxisExtent,
    required this.childMainAxisExtent,
  }) : assert(minChildCrossAxisExtent > 0),
       assert(mainAxisSpacing >= 0),
       assert(crossAxisSpacing >= 0),
       assert(childMainAxisExtent > 0);

  /// The number of logical pixels between each child along the main axis.
  final double mainAxisSpacing;

  /// The number of logical pixels between each child along the cross axis.
  final double crossAxisSpacing;

  /// This is height of child widget (Vertical GridView)
  /// or width of child widget (Horizontal GridView).
  final double childMainAxisExtent;

  /// This is min width of child widget (Vertical GridView).
  /// or min height of child widget (Horizontal GridView).
  final double minChildCrossAxisExtent;

  bool _debugAssertIsValid() {
    assert(minChildCrossAxisExtent > 0);
    assert(mainAxisSpacing >= 0.0);
    assert(crossAxisSpacing >= 0.0);
    assert(childMainAxisExtent > 0.0);
    return true;
  }

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    assert(_debugAssertIsValid());

    int crossAxisCount =
        (constraints.crossAxisExtent + crossAxisSpacing) ~/
        (minChildCrossAxisExtent + crossAxisSpacing);

    final double usableCrossAxisExtent =
        constraints.crossAxisExtent - crossAxisSpacing * (crossAxisCount - 1);

    final double childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    //
    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: childMainAxisExtent + mainAxisSpacing,
      crossAxisStride: childCrossAxisExtent + crossAxisSpacing,
      childMainAxisExtent: childMainAxisExtent,
      childCrossAxisExtent: childCrossAxisExtent,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(ChildFixedMainExtentAndMinCrossExtentSGD oldDelegate) {
    return oldDelegate.mainAxisSpacing != mainAxisSpacing ||
        oldDelegate.crossAxisSpacing != crossAxisSpacing ||
        oldDelegate.childMainAxisExtent != childMainAxisExtent ||
        oldDelegate.minChildCrossAxisExtent != minChildCrossAxisExtent;
  }
}
