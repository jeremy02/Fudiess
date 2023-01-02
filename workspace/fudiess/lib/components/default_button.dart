import 'package:flutter/material.dart';

import '../utils/constants.dart';

class DefaultButton extends StatelessWidget {
  final String buttonText;
  final EdgeInsets buttonPadding;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback buttonPress;
  final double? buttonWidth;
  final RoundedRectangleBorder? buttonBorder;

  const DefaultButton({
    Key? key,
    required this.buttonText,
    required this.buttonPadding,
    required this.fontSize,
    required this.buttonPress,
    required this.fontWeight,
    this.buttonWidth,
    this.buttonBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          Colors.white,
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          kPrimaryColor,
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          buttonPadding
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          buttonBorder ?? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              kDefaultPadding * 0.60,
            ),
          ),
        ),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: buttonWidth ?? 0
        ),
        child: Text(
          buttonText,
          softWrap: true,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: Colors.white,
          ),
        ),
      ),
      onPressed: buttonPress,
    );
  }
}
