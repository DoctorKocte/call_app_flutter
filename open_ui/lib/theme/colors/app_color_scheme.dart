import 'package:open_ui/theme/colors/gradient_colors.dart';
import 'package:open_ui/theme/colors/icon_colors.dart';
import 'package:open_ui/theme/colors/text_colors.dart';
import 'package:open_ui/theme/colors/background_colors.dart';

class AppColorScheme {
  const AppColorScheme({
    required this.background,
    required this.textColor,
    required this.gradients,
    required this.icons
  });

  factory AppColorScheme.light() => AppColorScheme(
    background: BackgroundColors.light(),
    textColor: TextColors.light(),
    gradients: GradientColors.light(),
    icons: IconColors.light()
  );

  factory AppColorScheme.dark() => AppColorScheme(
    background: BackgroundColors.dark(),
    textColor: TextColors.dark(),
    gradients: GradientColors.dark(),
    icons: IconColors.dark()
  );

  final BackgroundColors background;
  final TextColors textColor;
  final GradientColors gradients;
  final IconColors icons;
}
