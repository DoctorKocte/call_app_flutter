class GridSpacer {
  const GridSpacer({
    required this.sp4,
    required this.sp8,
    required this.sp10,
    required this.sp12,
    required this.sp16,
    required this.sp20,
    required this.sp24,
    required this.sp28,
    required this.sp32,
    required this.sp36,
    required this.sp40,
    required this.sp44,
    required this.sp48,
    required this.sp52,
    required this.sp56,
    required this.sp60,
    required this.sp64,
    required this.sp80
  });

  factory GridSpacer.regular() => const GridSpacer(
        sp4: 4,
        sp8: 8,
        sp10: 10,
        sp12: 12,
        sp16: 16,
        sp20: 20,
        sp24: 24,
        sp28: 28,
        sp32: 32,
        sp36: 36,
        sp40: 40,
        sp44: 44,
        sp48: 48,
        sp52: 52,
        sp56: 56,
        sp60: 60,
        sp64: 64,
        sp80: 80
      );

  final double sp4;
  final double sp8;
  final double sp10;
  final double sp12;
  final double sp16;
  final double sp20;
  final double sp24;
  final double sp28;
  final double sp32;
  final double sp36;
  final double sp40;
  final double sp44;
  final double sp48;
  final double sp52;
  final double sp56;
  final double sp60;
  final double sp64;
  final double sp80;
}
