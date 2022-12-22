import 'package:flutter/material.dart';

import '../../../components/rich_text_title.dart';
import '../../../utils/constants.dart';

class MenuTabItem extends StatelessWidget {
  const MenuTabItem({
    required Key key,
    required this.name,
    required this.imagePath,
    required this.isActive,
    required this.onSelectedMenuTab,
  }) : super(key: key);

  final String name;
  final String imagePath;
  final bool isActive;
  final Function onSelectedMenuTab;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        kDefaultPadding * 0.60,
      ),
      child: Material(
        color: isActive ? kPrimaryColor : Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              kDefaultPadding * 0.60,
            ),
          ),
          onTap: () {
            onSelectedMenuTab();
          },
          child: Padding(
            padding: const EdgeInsets.all(
                kDefaultPadding * 0.30
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Container(
                    padding: const EdgeInsets.all(
                        kDefaultPadding * 0.20
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