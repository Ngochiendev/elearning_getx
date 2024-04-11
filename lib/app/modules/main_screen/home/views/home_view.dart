import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/components/excercise/exercise_speaking.dart';
import 'package:elearning/app/data/models/user_exercise_model.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:elearning/generated/resource.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      color: colorPrimaryBlue5,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        16, MediaQuery.of(context).padding.top + 16, 16, 16),
                    child: Column(
                      children: [
                        SearchBar(),
                        BalanceBar(
                          controller: controller,
                        ),
                        ServiceMenu(
                          services: controller.services,
                          onSelectService: controller.onSelectService,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  children: [
                    Obx(
                      () => Container(
                        padding: EdgeInsets.only(top: 0, bottom: 8, left: 16),
                        child: Row(
                          children: [
                            Text(controller.nameNews.value, style: typoBold18),
                          ],
                        ),
                      ),
                    ),
                    Obx(() => Container(
                          // height: ,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(16),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.8,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16),
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () => Get.toNamed(Routes.DETAIL_NEWS,
                                    arguments: controller.listNew[i].id ?? 0),
                                child: Container(
                                  // height: 200,
                                  // width: double.infinity,
                                  // margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      color: colorWhite,
                                      boxShadow: boxShadow),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            height: 92,
                                            decoration: BoxDecoration(
                                              // color: Colors.red,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                            ),
                                            width: double.infinity,
                                            child: AppNetworkImage(
                                              source: controller
                                                      .listNew[i].thumbnail ??
                                                  "",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 12, 8, 8),
                                                child: Row(
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        controller.listNew[i]
                                                                .title ??
                                                            "",
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: typoLight14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 12, left: 8, right: 8),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                R.ASSETS_SVG_IC_CALENDAR_SVG),
                                            SizedBox(width: 8),
                                            Text(
                                                fullStringTimeFormat(controller
                                                    .listNew[i].createdAt
                                                    .toString()),
                                                style: typoLight12),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: controller.listNew.length,
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceMenu extends StatelessWidget {
  const ServiceMenu({
    Key? key,
    required this.services,
    required this.onSelectService,
  }) : super(key: key);

  final List<Map<String, String>> services;
  final void Function(Map<String, String>) onSelectService;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        color: colorWhite,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Wrap(
        children: services
            .map((e) => InkWell(
                  onTap: () {
                    onSelectService(e);
                  },
                  child: Container(
                    width: (MediaQuery.of(context).size.width - 64) / 3,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(e["icon"]!),
                        SizedBox(height: 8),
                        Text(
                          e["label"]!.tr,
                          style: typoLight14,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class BalanceBar extends StatelessWidget {
  final HomeController? controller;
  const BalanceBar({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(LocaleKeys.label_balanceHome.tr, style: typoRegular14),
              Obx(() => Text(
                    "${formatter.format(controller!.walletUser.toInt())} ${LocaleKeys.general_moneyUnit.tr}",
                    style: typoBold14,
                    maxLines: 1,
                  )),
            ],
          ),
          Row(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  child: Text(
                    LocaleKeys.label_rewardHome.tr,
                    style: typoRegular14,
                  ),
                ),
              ),
              Obx(
                () => Text(
                    "${formatter.format(controller!.pointCtrl.toInt())} ${LocaleKeys.general_rewardUnit.tr}",
                    style: typoBold14,
                    textAlign: TextAlign.end,
                    maxLines: 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final controller = Get.find<HomeController>();
  SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () => controller.tapSearch(),
              child: Container(
                height: 48,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: colorWhite,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(R.ASSETS_SVG_IC_SEARCH_24_SVG),
                    SizedBox(width: 8),
                    Text(LocaleKeys.placeHolder_searchHolder.tr,
                        style: typoRegular12search),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          SizedBox(
            width: 48,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.CART_PRODUCT);
              },
              style: styleButtonWhite,
              child: SvgPicture.asset(R.ASSETS_SVG_IC_CART_SVG),
            ),
          )
        ],
      ),
    );
  }
}
