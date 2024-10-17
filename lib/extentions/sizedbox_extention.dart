import 'package:flutter/widgets.dart';

extension SizedBoxExtension on int {
  /// Creates a SizedBox with a specific height based on the double value.
  /// Use this for adding vertical spacing in your layout.
  /// Example: 10.h creates a vertical space of 10 logical pixels.
  SizedBox get height => SizedBox(height: toDouble());

  /// Creates a SizedBox with a specific width based on the double value.
  /// Use this for adding horizontal spacing in your layout.
  /// Example: 10.w creates a horizontal space of 10 logical pixels.
  SizedBox get width => SizedBox(width: toDouble());
}