
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
  final bool? isOutlined;

  const DefaultButton({
    Key? key,
    required this.buttonText,
    required this.buttonPadding,
    required this.fontSize,
    required this.buttonPress,
    required this.fontWeight,
    this.buttonWidth,
    this.buttonBorder,
    this.isOutlined,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          isOutlined == true ? Colors.black12 : Colors.white,
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          isOutlined == true ? Colors.white : kPrimaryColor,
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
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            width: isOutlined == true ? 1 : 0,
            color: kPrimaryColor,
          ),
        ),
        overlayColor: MaterialStateProperty.resolveWith(
              (states) {
            return states.contains(MaterialState.pressed)
                ? isOutlined == true ? Colors.black12 : null
                : null;
          },
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
            color: isOutlined == true ? kPrimaryColor : Colors.white,
          ),
        ),
      ),
      onPressed: buttonPress,
    );
  }
}
