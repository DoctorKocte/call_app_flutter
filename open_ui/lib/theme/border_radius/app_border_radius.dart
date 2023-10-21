import 'package:flutter/material.dart';

class AppBorderRadius {
  const AppBorderRadius({
    required this.radius10,
    required this.radius12,
    required this.radius16,
    required this.radiusTop16,
    required this.radius21,
    required this.radius24,
    required this.radius30,
    required this.radius45,
    required this.radius60,
    required this.radius64
  });

  factory AppBorderRadius.regular() => const AppBorderRadius(
    radius10: BorderRadius.all(Radius.circular(10)),
    radius12: BorderRadius.all(Radius.circular(12)),
    radius16: BorderRadius.all(
      Radius.circular(16),
    ),
    radiusTop16: BorderRadius.vertical(
      top: Radius.circular(16)
    ),
    radius21: BorderRadius.all(Radius.circular(21)),
    radius24: BorderRadius.all(Radius.circular(24)),
    radius30: BorderRadius.all(Radius.circular(30)),
    radius45: BorderRadius.all(Radius.circular(45)),
    radius60: BorderRadius.all(Radius.circular(60)),
  radius64: BorderRadius.all(Radius.circular(64))


  );

  final BorderRadius radius10;
  final BorderRadius radius12;
  final BorderRadius radius16;
  final BorderRadius radiusTop16;
  final BorderRadius radius21;
  final BorderRadius radius24;
  final BorderRadius radius30;
  final BorderRadius radius45;
  final BorderRadius radius60;
  final BorderRadius radius64;
}
