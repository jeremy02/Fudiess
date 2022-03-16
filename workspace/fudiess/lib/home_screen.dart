import 'package:flutter/material.dart';
import 'package:fudiess/utils/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _controller.scaffoldkey,
      // SingleChildScrollView
      body: SafeArea(
        child: SafeArea(
          child: Responsive(
            mobile: Container(
              width: MediaQuery.of(context).size.width,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.yellow,
              ),
            ),
            tablet: Container(
              width: MediaQuery.of(context).size.width,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
            ),
            desktop: Container(
              width: MediaQuery.of(context).size.width,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
