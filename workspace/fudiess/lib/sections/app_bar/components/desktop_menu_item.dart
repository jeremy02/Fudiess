import 'package:flutter/material.dart';
import 'package:fudiess/utils/constants.dart';

class DeskTopMenuItem extends StatefulWidget {
  const DeskTopMenuItem({
    Key? key,
    required this.isActive,
    required this.text,
    required this.press,
  }) : super(key: key);

  final bool isActive;
  final String text;
  final VoidCallback press;

  @override
  _DeskTopMenuItemState createState() => _DeskTopMenuItemState();
}

class _DeskTopMenuItemState extends State<DeskTopMenuItem> {
  bool _isHover = false;

  // return the border and border color depending if meu item is hovered or active
  Border _activeAndHoverBorder() {
    if (widget.isActive) {
      return const Border(
        bottom: BorderSide(
          color: kPrimaryColor,
          width: 3,
        ),
      );
    } else if (!widget.isActive & _isHover) {
      return Border(
        bottom: BorderSide(
          color: kTextColor.withOpacity(0.25),
          width: 1.5,
        ),
      );
    } else {
      return const Border(
        bottom: BorderSide(color: Colors.transparent, width: 0.0),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: widget.press,
      onHover: (value) {
        setState(() {
          _isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: kDefaultDuration,
        margin: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding / 2,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: _activeAndHoverBorder(),
        ),
        child: Text(
          widget.text.toUpperCase(),
          style: TextStyle(
            fontSize: 14.0,
            color: kBodyTextColor,
            fontWeight: widget.isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
