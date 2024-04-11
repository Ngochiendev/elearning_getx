import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        title: Text(
          ' Thông báo ',
          style: typoBold24,
        ),
        centerTitle: false,
        actions: [
          SvgPicture.asset(R.ASSETS_SVG_IC_SEARCH_24_SVG),
          SizedBox(
            width: 8,
          ),
          SvgPicture.asset(R.ASSETS_SVG_IC_FILTER_BLACK_SVG),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            newNotifi(),
            newNotifi(),
            newNotifi(),
          ],
        ),
      ),
    );
  }

  Widget newNotifi() {
    return Wrap(
      children: [1, 2, 3, 4]
          .map((e) => Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: colorPrimaryBlue20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(e == 1
                          ? R.ASSETS_SVG_IC_NOTIFI_MUA2_SVG
                          : e == 2
                              ? R.ASSETS_SVG_IC_NOTIFI_SYSTEM_UPDATE_SVG
                              : e == 4
                                  ? R.ASSETS_SVG_IC_NOTIFI_RANKER_SVG
                                  : R.ASSETS_SVG_IC_NOTIFI_SUCCES_SVG),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e == 1
                                      ? "Mua 2 tặng 1"
                                      : e == 2
                                          ? "Update hệ thống"
                                          : e == 4
                                              ? "TOP 1"
                                              : "Hoàn thành khóa học",
                                  style: typoBold16,
                                ),
                                Text(
                                  e == 1
                                      ? "mới"
                                      : e == 2
                                          ? "1p"
                                          : "15p",
                                  style: typoRegular14,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    "Mua 2 tặng 1 khi mua các Khóa học của thầy Nguyễn Văn Anh",
                                    style: typoRegular14,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
