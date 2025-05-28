import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shimmer/shimmer.dart';

/// A shimmer container that displays a shimmer effect.
class ShimmerContainer extends StatelessWidget {
  /// Creates a [ShimmerContainer].
  const ShimmerContainer({
    required this.width,
    required this.height,
    super.key,
  });

  /// The width of the shimmer container.
  final double width;

  /// The height of the shimmer container.
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Shimmer.fromColors(
      baseColor: theme.colorScheme.border,
      highlightColor: theme.colorScheme.background,
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.background,
          borderRadius: BorderRadius.circular(10),
        ),
        height: height,
        width: width,
      ),
    );
  }
}
