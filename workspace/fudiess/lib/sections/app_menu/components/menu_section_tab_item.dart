import 'package:flutter/material.dart';

import '../../../components/rich_text_title.dart';
import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';

class MenuSectionTabItem extends StatelessWidget {
  const MenuSectionTabItem({
    required Key key,
    required this.name,
    required this.imagePath,
    required this.isActive,
    required this.onSelectedMenuTab,
    required this.borderRadius,
    required this.menuPadding,
  }) : super(key: key);

  final String name;
  final String imagePath;
  final bool isActive;
  final Function onSelectedMenuTab;
  final BorderRadius borderRadius;
  final EdgeInsets menuPadding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Material(
        color: isActive ? kPrimaryColor : Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () {
            onSelectedMenuTab();
          },
          child: Padding(
            padding: menuPadding,
            child: Responsive.isMobile(context) ?
              Image(
                fit: BoxFit.contain,
                image: AssetImage(
                  imagePath,
                ),
              )
            :
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Container(
                      padding: const EdgeInsets.all(
                          kDefaultPadding * 0.30
                      ),
                      color: isActive ? Colors.white : Colors.transparent,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image(
                          fit: BoxFit.contain,
                          image: AssetImage(
                            imagePath,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: kDefaultPadding,
                  ),
                  Flexible(
                    child: RichTextTitle(
                      text: name,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      textColor: isActive ? Colors.white : kTextColor,
                      alignStart: true,
                      textScaleFactor: 1.2,
                    ),
                  ),
                ],
              ),
          ),
        ),
      ),
    );
  }
}