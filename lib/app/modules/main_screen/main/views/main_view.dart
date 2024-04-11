import 'package:elearning/app/modules/cource_views/search/views/search_view.dart';
import 'package:elearning/app/modules/main_screen/home/views/home_view.dart';
import 'package:elearning/app/modules/main_screen/notification/views/notification_view.dart';
import 'package:elearning/app/modules/main_screen/profile/views/profile_view.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: [HomeView(), SearchView(), NotificationView(), ProfileView()],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(boxShadow: boxShadow),
          child: BottomNavigationBar(
            currentIndex: controller.tabIndex.value,
            onTap: controller.changeTabIndex,
            unselectedItemColor: colorNeutralGray60,
            selectedItemColor: colorPrimaryBlue100,
            selectedLabelStyle: typoSemiBold14,
            unselectedLabelStyle: typoRegular14,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 10,
            items: [
              _bottomNavigationBarItem(
                icon: R.ASSETS_SVG_IC_HOME_HEART_SVG,
                activeIcon: R.ASSETS_SVG_IC_HOME_HEART_BLUE_SVG,
                label: LocaleKeys.label_home.tr,
              ),
              _bottomNavigationBarItem(
                icon: R.ASSETS_SVG_IC_SEARCH_SVG,
                activeIcon: R.ASSETS_SVG_IC_SEARCH_BLUE_SVG,
                label: LocaleKeys.label_search.tr,
              ),
              _bottomNavigationBarItem(
                icon: R.ASSETS_SVG_IC_NOTIFICATION_SVG,
                activeIcon: R.ASSETS_SVG_IC_NOTIFICATION_BLUE_SVG,
                label: LocaleKeys.label_notification.tr,
              ),
              _bottomNavigationBarItem(
                icon: R.ASSETS_SVG_IC_ACCOUNT_CIRCLE_SVG,
                activeIcon: R.ASSETS_SVG_IC_ACCOUNT_CIRCLE_BLUE_SVG,
                label: LocaleKeys.label_profile.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      {String? icon, String? activeIcon, required String label, int? badge}) {
    if (badge != null && badge > 0) {
      return BottomNavigationBarItem(
        icon: Stack(
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset(icon!),
            Positioned(
              top: -5,
              left: 16,
              child: Container(
                width: 18,
                height: 18,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colorSemanticRed100,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Text(
                  '$badge',
                  style: typoRegular12.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        activeIcon: Stack(
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset(activeIcon!),
            Positioned(
              top: -5,
              left: 16,
              child: Container(
                width: 18,
                height: 18,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colorSemanticRed100,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Text(
                  '$badge',
                  style: typoRegular12.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        label: label,
      );
    }
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(icon!, width: 18, height: 18),
      activeIcon: SvgPicture.asset(activeIcon!, width: 18, height: 18),
      label: label,
    );
  }
}
