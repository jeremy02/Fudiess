import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fudiess/utils/constants.dart';

class MoreMenuButton extends StatelessWidget {
  const MoreMenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.white;
                  }
                  return Colors.black12.withOpacity(0.1);
                },
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    kDefaultPadding * 0.75,
                  ),
                ),
              ),
              elevation: MaterialStateProperty.all<double>(0.5),
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(
                    kDefaultPadding
                ),
              ),
            ),
            child: SizedBox(
              width: constraints.maxWidth * 0.5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'More Menu',
                    softWrap: true,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(
                    width: kDefaultPadding * 0.5,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: kDefaultPadding,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
            onPressed: () {},
          );
        }
    );
  }
}
