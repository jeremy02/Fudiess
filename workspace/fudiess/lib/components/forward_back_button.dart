import 'package:flutter/material.dart';

class ForwardBackButton extends StatelessWidget {
  final Color bgColor;
  final double padding;
  final double radius;
  final double elevation;
  final Icon icon;
  final VoidCallback buttonPress;

  const ForwardBackButton({
    Key? key,
    required this.bgColor,
    required this.padding,
    required this.radius,
    required this.elevation,
    required this.icon,
    required this.buttonPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          radius
        ),
      ),
      elevation: elevation,
      child: InkWell(
        onTap: buttonPress,
        splashColor: Colors.black12,
        borderRadius: BorderRadius.circular(
          radius,
        ),
        child: Padding(
          padding: EdgeInsets.all(
            padding,
          ),
          child: icon
        ),
      ),
    );
  }
}
