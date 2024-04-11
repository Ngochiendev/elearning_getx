import 'package:elearning/app/modules/cource_views/empty_view/views/empty_view_view.dart';
import 'package:elearning/app/modules/ebook_views.dart/ebook/views/ebook_view.dart';
import 'package:elearning/app/modules/ebook_views.dart/search_ebook/views/search_ebook_view.dart';
import 'package:elearning/app/modules/main_screen/notification/views/notification_view.dart';
import 'package:elearning/app/modules/main_screen/profile/views/profile_view.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/main_ebook_controller.dart';

class MainEbookView extends GetView<MainEbookController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: [
            EbookView(),
            SearchEbookView(),
            EmptyViewView(),
            NotificationView(),
            ProfileView()
          ],
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
            selectedLabelStyle: typoSemiBold10,
            unselectedLabelStyle: typoRegular10,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 10,
            items: [
              _bottomNavigationBarItem(
                icon: R.ASSETS_SVG_IC_EBOOK_SVG,
                activeIcon: R.ASSETS_SVG_IC_EBOOK_BLUE_SVG,
                label: LocaleKeys.label_ebook4.tr,
              ),
              _bottomNavigationBarItem(
                icon: R.ASSETS_SVG_IC_SEARCH_SVG,
                activeIcon: R.ASSETS_SVG_IC_SEARCH_BLUE_SVG,
                label: LocaleKeys.label_search.tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.ac_unit,
                  color: Colors.transparent,
                ),
                label: "",
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom != 0.0
          ? null
          : Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.MY_EBOOK);
                  },
                  child: Container(
                      width: 48,
                      height: 48,
                        child: Image.asset(R.ASSETS_PNG_IC_PLAYHOMEWORK_PNG)),
                ),
                  Container(
                    height: 4,
                  ),
                Text(
                  LocaleKeys.label_readbook.tr,
                  style: typoRegular12.copyWith(color: colorNeutralGray80),
                ),
                Container(
                  height: 13,
                ),
              ],
            ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      {String? icon, String? activeIcon, required String label, int? badge}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(icon!),
      activeIcon: SvgPicture.asset(activeIcon!),
      label: label,
    );
  }
}
