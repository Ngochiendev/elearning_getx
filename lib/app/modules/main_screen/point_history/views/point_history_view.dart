import 'dart:math';

import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elearning/generated/resource.dart';
import 'package:get/get.dart';

import '../controllers/point_history_controller.dart';

class PointHistoryView extends GetView<PointHistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackButton(
            color: colorBlack,
          ),
          title: Text(
            "Tích điểm",
            style: typoBold24,
          ),
          centerTitle: true,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    color: colorbgPoint,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Số điểm hiện tại:",
                          style: typoRegular14,
                        ),
                        Row(
                          children: [
                            Obx(
                              () => Text(
                                "${formatter.format(controller.point.value)}",
                                style: typoRegular32,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 16.8,
                              width: 16.8,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          R.ASSETS_PNG_IC_REWARD_PNG))),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  color: colorWhite,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 24),
                        child: Row(
                          children: [
                            Text(
                              "Lịch sử tích điểm",
                              style: typoBold18,
                            ),
                          ],
                        ),
                      ),
                      Obx(
                        () => Container(
                          color: colorWhite,
                          height: MediaQuery.of(context).size.height,
                          child: Wrap(
                            children: controller.listPointHistory
                                .map((e) => buildItem(
                                      context,
                                      type: e.merchantCode == "e-learning"
                                          ? "học"
                                          : "thi",
                                      date: e.createdAt.toString(),
                                      point: e.balance,
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildItem(BuildContext context,
      {String? type, String? date, int? point}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(R.ASSETS_SVG_ICF_LEARNNING_PROGRESS_SVG),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 64) / 2,
                    child: Text(
                      "$type ${fullStringTimeFormat(date)} lúc ${fullStringTimerFormat(date)}",
                      style: typoRegular14,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "${formatter.format(point)}",
                    style: typoRegular14Blue,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    height: 16.8,
                    width: 16.8,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(R.ASSETS_PNG_IC_REWARD_PNG))),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
