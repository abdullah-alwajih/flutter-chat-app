part of 'app_themes.dart';

abstract class AppColors {
  static const _secondaryLight = Color(0xFF2D376F);
  static const _secondaryContainerLight =Color(0xFF006CFA);
  static const MaterialColor primarySwatch = MaterialColor(
    0xFFFFA400,
    <int, Color>{
      50: Color(0xFFfff3de),
      100: Color(0xFFffe0ae),
      200: Color(0xFFffcb78),
      300: Color(0xFFffb640),
      400: Color(0xFFffa600),
      500: Color(0xFFff9600),
      600: Color(0xFFfc8a00),
      700: Color(0xFFf77900),
      800: Color(0xFFf26800),
      900: Color(0xFFe94b00),
    },
  );

  static ColorScheme colorSchemeLight = ColorScheme.light(
    primary: primarySwatch,
    primaryContainer: primarySwatch.shade300,
    secondary: const Color(0xFF2D376F),
    secondaryContainer: const Color(0xFF006CFA),
  );

  static ColorScheme colorSchemeDark = ColorScheme.dark(
    primary: primarySwatch,
    primaryContainer: primarySwatch.shade300,
    secondary: const Color(0xFF2D376F),
    secondaryContainer: const Color(0xFF006CFA),
  );
}
