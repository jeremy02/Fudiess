import 'package:flutter/material.dart';

import '../utils/constants.dart';

class DefaultButton extends StatelessWidget {
  final String buttonText;
  final double horizontalPadding;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback buttonPress;

  const DefaultButton({
    Key? key,
    required this.buttonText,
    required this.horizontalPadding,
    required this.fontSize,
    required this.buttonPress,
    required this.fontWeight,
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
          EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: kDefaultPadding,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              kDefaultPadding * 0.60,
            ),
            side: const BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
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
      onPressed: buttonPress,
    );
  }
}
