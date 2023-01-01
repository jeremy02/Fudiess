import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fudiess/utils/constants.dart';
import 'package:fudiess/utils/responsive.dart';

class SubscribeButton extends StatelessWidget {
  const SubscribeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kBackgroundColor,
      ),
      margin: const EdgeInsets.fromLTRB(
          kDefaultPadding * 0.25, kDefaultPadding * 0.25, 0, kDefaultPadding * 0.25
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(
              kDefaultPadding * 0.85
          ),
          primary: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Responsive.isMobile(context) ? kDefaultPadding * 0.5 : kDefaultPadding * 0.75,
            ),
          ),
        ),
        child: const Text(
          'Subscribe Now',
          softWrap: true,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
