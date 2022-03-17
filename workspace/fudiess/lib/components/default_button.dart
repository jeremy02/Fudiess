import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';

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
    required this.fontWeight,
    required this.buttonPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: kDefaultPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            kDefaultPadding * 0.80,
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
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      onPressed: () {},
    );
  }
}
