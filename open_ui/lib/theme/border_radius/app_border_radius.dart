import 'package:flutter/material.dart';

class AppBorderRadius {
  const AppBorderRadius({
    required this.radius16,
    required this.radiusTop16
  });

  factory AppBorderRadius.regular() => const AppBorderRadius(
    radius16: BorderRadius.all(
      Radius.circular(16),
    ),
    radiusTop16: BorderRadius.vertical(
      top: Radius.circular(16)
    )
  );

  final BorderRadius radius16;
  final BorderRadius radiusTop16;
}
