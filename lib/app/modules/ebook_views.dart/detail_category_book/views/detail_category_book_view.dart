import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/data/models/book_models/authors_model.dart';
import 'package:elearning/app/data/models/book_models/book_model.dart';
import 'package:elearning/app/data/models/purchase_packages.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elearning/generated/resource.dart';
import 'package:get/get.dart';

import '../controllers/detail_category_book_controller.dart';

class DetailCategoryBookView extends GetView<DetailCategoryBookController> {
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // key: _scaffoldKey1,
        // endDrawer: NavDrawer(),
        // endDrawerEnableOpenDragGesture: false,
        appBar: AppBar(
          backgroundColor: colorWhite,
          title: Text(
            controller.title.value,
            style: typoBold24,
          ),
          centerTitle: true,
          leading: BackButton(
            color: colorBlack,
          ),
          // actions: [
          //   GestureDetector(
          //     onTap: () {
          //       _scaffoldKey1.currentState!.openEndDrawer();
          //     },
          //     child: Container(
          //       margin: EdgeInsets.only(right: 16),
          //       child: SvgPicture.asset(R.ASSETS_SVG_IC_FILTER_BLACK_SVG),
          //     ),
          //   ),
          // ],
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(16),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    controller.title.value == "Tin tức"
                        ? newsContent(context)
                        : controller.title.value == "Sách khuyến mại"
                            ? bookDiscount(context)
                            : Get.arguments["isTitle"] == "Top yêu thích"
                                ? bookTopTrend(context)
                                : booksCategoryHome(context)
                  ],
                ),
              )),
        ),
      ),
    );
  }

  bookTopTrend(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        controller.listSubjectBookHome.length > 0
            ? GridView.builder(
                padding: EdgeInsets.all(0),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.38,
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemCount: controller.listSubjectBookHome.value.length,
                itemBuilder: (context, index) {
                  final purchase = controller
                      .listSubjectBookHome.value[index].purchasePackages;
                  PurchasePackageHome? purchasePackages;
                  if (purchase != null && purchase.length > 0) {
                    purchasePackages = purchase.first;
                  }
                  final author = controller.listSubjectBookHome[index].authors;
                  Author? au;
                  if (author != null && author.length > 0) {
                    au = author.first;
                  }
                  return GestureDetector(
                    onTap: () => Get.toNamed(Routes.EBOOK_DETAILS, arguments: {
                      "id": controller.listSubjectBookHome.value[index].id,
                    }),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 64) / 2,
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: colorWhite,
                          boxShadow: boxShadow),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 200,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8)),
                                ),
                                child: AppNetworkImage(
                                  source: controller.listSubjectBookHome
                                          .value[index].cover ??
                                      "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              controller
                                      .listSubjectBookHome.value[index].title ??
                                  "",
                              style: typoBold14,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                au?.name ?? "",
                                style: typoRegular12.copyWith(
                                    color: colorNeutralGray40),
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )),
                          controller.listSubjectBookHome[index]
                                      .specifyCategories!.length ==
                                  0
                              ? SizedBox(
                                  height: 35,
                                )
                              : Wrap(
                                  children: controller.listSubjectBookHome
                                      .value[index].specifyCategories!
                                      .take(1)
                                      .map((e2) => Row(
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4,
                                                            horizontal: 8),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4,
                                                            horizontal: 8),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  50)),
                                                      color:
                                                          colorSemanticBlue20,
                                                    ),
                                                    child: Text(
                                                      e2.name!,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: typoRegular14,
                                                    )),
                                              ),
                                              controller
                                                              .listSubjectBookHome
                                                              .value[index]
                                                              .specifyCategories!
                                                              .length -
                                                          1 ==
                                                      0
                                                  ? Container()
                                                  : Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                          width: 24,
                                                          height: 24,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 8),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 4,
                                                                  horizontal:
                                                                      4),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            24)),
                                                            color:
                                                                colorSemanticBlue20,
                                                          ),
                                                          child: Text(
                                                            "+${controller.listSubjectBookHome.value[index].specifyCategories!.length - 1}",
                                                            style:
                                                                typoRegular12,
                                                          )),
                                                    )
                                            ],
                                          ))
                                      .toList(),
                                ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Text(
                                  "${controller.listSubjectBookHome.value[index].ratingAvg ?? 0}",
                                  style: typoBold12,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  child: Icon(Icons.star, color: Colors.yellow),
                                ),
                                Expanded(
                                  child: Text(
                                    "( ${controller.listSubjectBookHome.value[index].totalCountRating ?? 0} xếp hạng)",
                                    style: typoRegular10.copyWith(
                                        color: colorNeutralGray40),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 25,
                            child: Visibility(
                              visible: controller.listSubjectBookHome
                                      .value[index].isFree ==
                                  false,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8, left: 8, right: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                        "${purchasePackages?.retailPrice ?? 0} đ",
                                        style: typoLight12.copyWith(
                                            decoration:
                                                TextDecoration.lineThrough))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 25,
                            child: controller.listSubjectBookHome.value[index]
                                        .isFree ==
                                    true
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8, left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("Miễn phí",
                                            style: typoLight14.copyWith(
                                                color: colorSemanticGreen100))
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8, left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                            "${formatter.format(purchasePackages?.discountPrice ?? 0)} đ",
                                            style: typoLight14.copyWith(
                                                color: colorSemanticRed100))
                                      ],
                                    ),
                                  ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            child: ElevatedButtonBase(
                              mainColor: controller.listSubjectBookHome
                                          .value[index].isFree ==
                                      true
                                  ? colorSemanticGreen100
                                  : colorPrimaryBlue100,
                              height: 32,
                              size: 14,
                              buttonTitle: controller.listSubjectBookHome
                                          .value[index].isFree ==
                                      true
                                  ? "Đọc miễn phí"
                                  : controller.listSubjectBookHome.value[index]
                                              .isAlreadyPurchased ==
                                          1
                                      ? "Đọc tiếp"
                                      : controller.listSubjectBookHome
                                                  .value[index].isAllowTrial ==
                                              true
                                          ? "Đọc thử"
                                          : "Xem chi tiết",
                              onPressed: () async {
                                if (controller.listSubjectBookHome.value[index]
                                        .isFree ==
                                    true) {
                                  Get.toNamed(Routes.READ_BOOK, arguments: {
                                    "id": controller
                                        .listSubjectBookHome.value[index].id,
                                    "isFree": controller.listSubjectBookHome
                                        .value[index].isFree,
                                  });
                                } else if (controller.listSubjectBookHome
                                        .value[index].isAlreadyPurchased ==
                                    1) {
                                  Get.toNamed(Routes.READ_BOOK, arguments: {
                                    "id": controller
                                        .listSubjectBookHome.value[index].id,
                                    "isAlreadyPurchased": controller
                                        .listSubjectBookHome
                                        .value[index]
                                        .isAlreadyPurchased,
                                  });
                                } else if (controller.listSubjectBookHome
                                        .value[index].isAllowTrial ==
                                    true) {
                                  Get.toNamed(Routes.READ_BOOK, arguments: {
                                    "id": controller
                                        .listSubjectBookHome.value[index].id,
                                    "isAllowtrail": controller
                                        .listSubjectBookHome
                                        .value[index]
                                        .isAllowTrial,
                                    "isAlreadyPurchased": controller
                                        .listSubjectBookHome
                                        .value[index]
                                        .isAlreadyPurchased,
                                  });
                                } else {
                                  Get.toNamed(Routes.EBOOK_DETAILS, arguments: {
                                    "id": controller
                                        .listSubjectBookHome.value[index].id,
                                    "isAllowtrail": controller
                                        .listSubjectBookHome
                                        .value[index]
                                        .isAllowTrial,
                                    "isAlreadyPurchased": controller
                                        .listSubjectBookHome
                                        .value[index]
                                        .isAlreadyPurchased,
                                    "isFree": controller.listSubjectBookHome
                                        .value[index].isFree,
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
      ],
    );
  }

  newsContent(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Obx(
            () => Container(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: controller.news.value.length,
                itemBuilder: (context, e) => GestureDetector(
                  onTap: () {
                    controller.detailNews(controller.news[e].id);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 120,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: colorWhite,
                        boxShadow: boxShadow),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 170,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                          ),
                          child: AppNetworkImage(
                            source: controller.news.value[e].thumbnail ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(children: [
                                TextSpan(
                                  text: controller.news[e].author ?? "",
                                  style: typoRegular14.copyWith(
                                      color: colorNeutralGray600),
                                ),
                                TextSpan(text: "   "),
                                TextSpan(
                                  text: fullStringTimeFormat(
                                      controller.news[e].updatedAt ?? ""),
                                  style: typoRegular14.copyWith(
                                      color: colorNeutralGray90),
                                ),
                              ])),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, left: 8, right: 8),
                          child: Text(
                            controller.news.value[e].title ?? "",
                            style: typoLight12,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
  bookDiscount(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Wrap(
            children: controller.bookSaleModel.value.map(
              (e) {
                final author = e.authors;
                Author? au;
                if (author != null && author.length > 0) {
                  au = author.first;
                }
                return GestureDetector(
                  onTap: () => Get.toNamed(Routes.EBOOK_DETAILS,
                      arguments: {"id": e.id}),
                  child: Container(
                    width: (MediaQuery.of(context).size.width - 64) / 2,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: colorWhite,
                        boxShadow: boxShadow),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                              ),
                              child: AppNetworkImage(
                                source: e.cover ?? "",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            e.title ?? "",
                            style: typoBold14,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              au?.name ?? "",
                              style: typoRegular12.copyWith(
                                  color: colorNeutralGray40),
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                        e.specifyCategories!.length == 0
                            ? SizedBox(
                                height: 34,
                              )
                            : Wrap(
                                children: e.specifyCategories!
                                    .take(1)
                                    .map((e2) => Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 4,
                                                      horizontal: 8),
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4,
                                                      horizontal: 8),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                50)),
                                                    color: colorSemanticBlue20,
                                                  ),
                                                  child: Text(
                                                    e2.name!,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: typoRegular14,
                                                  )),
                                            ),
                                            e.specifyCategories!.length - 1 == 0
                                                ? Container()
                                                : Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                        width: 24,
                                                        height: 24,
                                                        margin: EdgeInsets.only(
                                                            right: 8),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 4,
                                                                horizontal: 4),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          24)),
                                                          color:
                                                              colorSemanticBlue20,
                                                        ),
                                                        child: Text(
                                                          "+${e.specifyCategories!.length - 1}",
                                                          style: typoRegular12,
                                                        )),
                                                  )
                                          ],
                                        ))
                                    .toList(),
                              ),
                        Row(
                          children: [
                            Text(
                              "4.3",
                              style: typoBold12,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              child: Icon(Icons.star, color: Colors.yellow),
                            ),
                            Expanded(
                              child: Text(
                                "( 20.123 xếp hạng)",
                                style: typoRegular10.copyWith(
                                    color: colorNeutralGray40),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: ElevatedButtonBase(
                            height: 32,
                            mainColor: colorSemanticGreen100,
                            size: 12,
                            buttonTitle: "Đọc miễn phí",
                            onPressed: () async {
                              Get.toNamed(Routes.READ_BOOK,
                                  arguments: {"id": e.id, "isFree": e.isFree});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }

  booksCategoryHome(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Wrap(
            children: controller.bookCategoryHome.value.books!.map(
              (e) {
                final purchase = e.purchasePackages;
                PurchasePackageHome? purchasePackages;
                if (purchase != null && purchase.length > 0) {
                  purchasePackages = purchase.first;
                }
                final author = e.authors;
                Author? au;
                if (author != null && author.length > 0) {
                  au = author.first;
                }
                return GestureDetector(
                  onTap: () => Get.toNamed(Routes.EBOOK_DETAILS,
                      arguments: {"id": e.id}),
                  child: Container(
                    width: (MediaQuery.of(context).size.width - 64) / 2,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: colorWhite,
                        boxShadow: boxShadow),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                              ),
                              child: AppNetworkImage(
                                source: e.cover ?? "",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            e.title ?? "",
                            style: typoBold14,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              au?.name ?? "",
                              style: typoRegular12.copyWith(
                                  color: colorNeutralGray40),
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                        e.specifyCategories!.length == 0
                            ? SizedBox(
                                height: 34,
                              )
                            : Wrap(
                                children: e.specifyCategories!
                                    .take(1)
                                    .map((e2) => Row(
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 4, horizontal: 8),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 4, horizontal: 8),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50)),
                                                  color: colorSemanticBlue20,
                                                ),
                                                child: Text(
                                                  e2.name!,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: typoRegular14,
                                                ),
                                              ),
                                            ),
                                            e.specifyCategories!.length - 1 == 0
                                                ? Container()
                                                : Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                        width: 24,
                                                        height: 24,
                                                        margin: EdgeInsets.only(
                                                            right: 8),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 4,
                                                                horizontal: 4),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          24)),
                                                          color:
                                                              colorSemanticBlue20,
                                                        ),
                                                        child: Text(
                                                          "+${e.specifyCategories!.length - 1}",
                                                          style: typoRegular12,
                                                        )),
                                                  )
                                          ],
                                        ))
                                    .toList(),
                              ),
                        Row(
                          children: [
                            Text(
                              "${e.ratingAvg ?? 0}",
                              style: typoBold12,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              child: Icon(Icons.star, color: Colors.yellow),
                            ),
                            Expanded(
                              child: Text(
                                "( ${e.totalCountRating} xếp hạng)",
                                style: typoRegular10.copyWith(
                                    color: colorNeutralGray40),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 25,
                          child: Visibility(
                            visible: e.isFree == false,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8, left: 8, right: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                      "${purchasePackages?.retailPrice ?? 0} đ",
                                      style: typoLight12.copyWith(
                                          decoration:
                                              TextDecoration.lineThrough))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 25,
                          child: e.isFree == true
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8, left: 8, right: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("Miễn phí",
                                          style: typoLight14.copyWith(
                                              color: colorSemanticGreen100))
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8, left: 8, right: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                          "${formatter.format(purchasePackages?.discountPrice ?? 0)} đ",
                                          style: typoLight14.copyWith(
                                              color: colorSemanticRed100))
                                    ],
                                  ),
                                ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: ElevatedButtonBase(
                            mainColor: e.isFree == true
                                ? colorSemanticGreen100
                                : colorPrimaryBlue100,
                            height: 32,
                            size: 14,
                            buttonTitle: e.isFree == true
                                ? "Đọc miễn phí"
                                : e.isAlreadyPurchased == 1
                                    ? "Đọc tiếp"
                                    : e.isAllowTrial == 1
                                        ? "Đọc thử"
                                        : "Xem chi tiết",
                            onPressed: () async {
                              if (e.isFree == true) {
                                Get.toNamed(Routes.READ_BOOK, arguments: {
                                  "id": e.id,
                                  "isFree": e.isFree,
                                });
                              } else if (e.isAlreadyPurchased == 1) {
                                Get.toNamed(Routes.READ_BOOK, arguments: {
                                  "id": e.id,
                                  "isAlreadyPurchased": e.isAlreadyPurchased
                                });
                              } else if (e.isAllowTrial == 1) {
                                Get.toNamed(Routes.READ_BOOK, arguments: {
                                  "id": e.id,
                                  "isAllowtrail": e.isAllowTrial,
                                });
                              } else {
                                Get.toNamed(Routes.EBOOK_DETAILS, arguments: {
                                  "id": e.id,
                                  "isAllowtrail": e.isAllowTrial,
                                  "isAlreadyPurchased": e.isAlreadyPurchased,
                                  "isFree": e.isFree,
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
