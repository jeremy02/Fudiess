import 'package:flutter/material.dart';

class RichTextTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final bool? alignStart;
  final String? coloredText;
  final Color? coloredTextColor;
  final double? coloredTextFontSize;
  final FontWeight? coloredTextFontWeight;
  final double? textScaleFactor;
  final bool? isResponsiveText;

  const RichTextTitle({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.textColor,
    this.alignStart = false,
    this.coloredText,
    this.coloredTextColor,
    this.coloredTextFontSize,
    this.coloredTextFontWeight,
    this.textScaleFactor,
    this.isResponsiveText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isResponsiveText == true ?
      FittedBox(
          fit: BoxFit.fitWidth,
          child: _buildRichTextTitle(context)
      )
        :
    _buildRichTextTitle(context);
  }

  Widget _buildRichTextTitle(BuildContext context) {
    return RichText(
      textAlign: alignStart==true ? TextAlign.start : TextAlign.center,
      // textScaleFactor: textScaleFactor ?? 0.0,
      text: TextSpan(
        text: text,
        style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: fontWeight,
            height: textScaleFactor ?? 0.0
        ),
        children: coloredText != null ? <TextSpan>[
          TextSpan(
            text: coloredText,
            style: TextStyle(
              fontSize: coloredTextFontSize ?? fontSize,
              color: coloredTextColor,
              fontWeight: coloredTextFontWeight ?? fontWeight,
            ),
          )
        ]
            :
        <TextSpan>[],
      ),
    );
  }
}
