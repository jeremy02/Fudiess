import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../../utils/responsive.dart';
import 'components/footer_section_about_fudiess_layout.dart';
import 'components/footer_section_pages_services_layout.dart';
import 'models/footer_sections.dart';

class AppFooterSection extends StatelessWidget {
  AppFooterSection({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
      AnimatedContainer(
        constraints: const BoxConstraints(
          maxWidth: kMaxWidth,
        ),
        decoration: const BoxDecoration(
          color: kBackgroundColor,
        ),
        duration: const Duration(
          milliseconds: 500,
        ),
        // Provide an optional curve to make the animation feel smoother.
        curve: Curves.fastLinearToSlowEaseIn,
        child: Padding(
          padding: EdgeInsets.only(
            top: Responsive.isMobile(context)
                ? kDefaultPadding * 4
                : kDefaultPadding * 8,
            bottom: Responsive.isMobile(context)
                ? kDefaultPadding * 2
                : kDefaultPadding * 4,
            left: Responsive.isMobile(context)
                ? kDefaultPadding
                : kDefaultPadding * 2,
            right: Responsive.isMobile(context)
                ? kDefaultPadding
                : kDefaultPadding * 2,
          ),
          child: Responsive.isMobile(context) ? _buildFooterMobileLayout(
              context) : _buildFooterLayout(context),
        ),
      ),
    );
  }

  Widget _buildFooterMobileLayout(BuildContext context) {

    final FooterSectionsController _controller = Get.put(FooterSectionsController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(
              flex: 2,
              child: FooterSectionAboutFoodiesLayout(),
            ),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: kDefaultPadding / 2.5,
                  ),
                  FooterSectionPagesServiceLayout(
                    title: _controller.footerPagesTitle,
                    pageServicesList: _controller.footerPages,
                    addSpacing: true,
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  FooterSectionPagesServiceLayout(
                    title: _controller.footerServicesTitle,
                    pageServicesList: _controller.footerServices,
                    addSpacing: true,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: kDefaultPadding,
        ),
        FooterSectionPagesServiceLayout(
          title: _controller.footerCompaniesTitle,
          pageServicesList: _controller.footerCompanies,
          addSpacing: false,
        ),
      ],
    );
  }

  Widget _buildFooterLayout(BuildContext context) {

    final FooterSectionsController _controller = Get.put(FooterSectionsController());

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Flexible(
          flex: 2,
          child: FooterSectionAboutFoodiesLayout(),
        ),
        SizedBox(
          width: Responsive.isTablet(context) ? kDefaultPadding * 2 : kDefaultPadding * 4,
        ),
        Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: FooterSectionPagesServiceLayout(
                        title: _controller.footerPagesTitle,
                        pageServicesList: _controller.footerPages,
                        addSpacing: true,
                      ),
                    ),
                    const SizedBox(
                      width: kDefaultPadding * 2,
                    ),
                    Flexible(
                      child: FooterSectionPagesServiceLayout(
                        title: _controller.footerServicesTitle,
                        pageServicesList: _controller.footerServices,
                        addSpacing: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kDefaultPadding * 2,
                ),
                FooterSectionPagesServiceLayout(
                  title: _controller.footerCompaniesTitle,
                  pageServicesList: _controller.footerCompanies,
                  addSpacing: false,
                ),
              ],
            ),
        ),
      ],
    );
  }
}
