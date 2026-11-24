import 'package:material_ui/material_ui.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String fontFamily;
  final double letterSpacing;
  final FontStyle fontStyle;

  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    this.fontFamily = 'Roboto',
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.letterSpacing = 0,
    this.fontStyle = FontStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
      ),
    );
  }
}