import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class MenuTabIndicatorItem extends StatelessWidget {
  const MenuTabIndicatorItem({
    required Key key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          kDefaultPadding,
        ),
        child: Container(
          color: isActive ? kPrimaryColor : kBgColor,
        ),
      ),
    );
  }
}