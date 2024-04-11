import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Transform.scale(
          scale: 1.5,
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              child: Image.asset(R.ASSETS_PNG_IC_LOGO_SC_PNG),
            ),
          ),
        ),
      ),
    );
  }
}
