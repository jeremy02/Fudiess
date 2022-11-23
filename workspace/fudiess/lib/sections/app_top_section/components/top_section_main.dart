import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';

class TopSectionMain extends StatelessWidget {
  const TopSectionMain({
    required Key key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {

    Duration duration = const Duration(milliseconds: 200);

    return Expanded(
        child: AnimatedContainer(
              duration: duration,
              width: double.infinity,
              height: double.infinity,
              child: Flex(
                direction: Responsive.isMobile(context) ? Axis.vertical : Axis.horizontal,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 3,
                      child: topContainerImageLayout(context)
                  ),
                  SizedBox(
                    height: Responsive.isMobile(context) ? kDefaultPadding : 0,
                  ),
                  Expanded(
                    flex: 4,
                    child: topContainerTextLayout(context),
                  )
                ],
              ),
        ),
    );
  }

  // this displays the top containers image
  Widget topContainerImageLayout(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FractionallySizedBox(
            heightFactor: Responsive.isMobile(context) ? 1 : 0.75,
            widthFactor: 0.75,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      "assets/images/ic_top_section_main_1x.png",
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // this displays the top containers text layout
  Widget topContainerTextLayout(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.97,
      heightFactor: 0.9,
      alignment: FractionalOffset.centerLeft,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 4,
          ),
        ),
      ),
    );
  }
}