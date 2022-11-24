import 'package:flutter/material.dart';

class RichTextTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final bool? alignStart;
  final String? coloredText;
  final Color? coloredTextColor;
  final double? textScaleFactor;

  const RichTextTitle({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.textColor,
    this.alignStart = false,
    this.coloredText,
    this.coloredTextColor,
    this.textScaleFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              color: coloredTextColor,
            ),
          )
        ]
            :
        <TextSpan>[],
      ),
    );
  }
}
