import 'dart:ui';

class ColorUtils {
  // @hexColorCode: "#448AFF"
  static Color fromHex16ColorCode({
    required String hexColorCode,
    required Color defaultColor,
  }) {
    try {
      final hexCode = hexColorCode.replaceAll('#', '');
      return Color(int.parse('FF$hexCode', radix: 16));
    } catch (e) {
      return defaultColor;
    }
  }
}
