import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/data/models/book_models/authors_model.dart';
import 'package:elearning/app/data/models/purchase_packages.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/result_search_ebook_controller.dart';

class ResultSearchEbookView extends GetView<ResultSearchEbookController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colorWhite,
      endDrawer: SideMenuBook(),
      endDrawerEnableOpenDragGesture: false,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        // title: Text("Kết quả", style: typoBold24),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(85),
            child: Obx(
              () => Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 16, right: 6, bottom: 16),
                          height: 48,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: colorWhite,
                            boxShadow: boxShadow,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(R.ASSETS_SVG_IC_SEARCH_24_SVG),
                              SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  onChanged: (text) {
                                    // if (text.length > 0) {
                                    //   controller.isTypingSearch.value = true;

                                    //   print(text);
                                    // } else {
                                    //   controller.isTypingSearch.value = false;
                                    // }
                                  },
                                  onSubmitted: (value) {
                                    controller.tapSearch(value);
                                  },
                                  controller: controller.searchTextField,
                                  textInputAction: TextInputAction.search,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    // labelText: controller.textSearch.value,
                                    // label: Text(controller.textSearch.value),
                                    hintText: LocaleKeys.placeHolder_searchHolder.tr,
                                    hintStyle: typoRegular12,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            _scaffoldKey.currentState!.openEndDrawer();
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 6, right: 16, bottom: 16),
                            height: 48,
                            width: 48,
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              color: colorWhite,
                              boxShadow: boxShadow,
                            ),
                            child: Obx(() => SvgPicture.asset(controller.hasFilter.value == true
                                ? R.ASSETS_SVG_IC_FILTER_RED_SVG
                                : R.ASSETS_SVG_IC_FILTER_BLACK_SVG)),
                          ))
                    ],
                  ),
                  Container(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              await controller.tapCategory(0);
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Liên quan",
                                        style: typoRegular12.copyWith(
                                            color: controller.index.value == 0
                                                ? colorSemanticRed100
                                                : colorNeutralGray90)),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: controller.index.value == 0 ? colorSemanticRed100 : Colors.transparent,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                      ),
                                      height: 4,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              await controller.tapCategory(1);
                              controller.onTapMin(controller.min.value = !controller.min.value);
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Giá",
                                          style: typoRegular12.copyWith(
                                              color: controller.index.value == 1
                                                  ? colorSemanticRed100
                                                  : colorNeutralGray90),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Obx(() => SvgPicture.asset(
                                          controller.min.value
                                              ? R.ASSETS_SVG_IC_ROWDOWNRED_SVG
                                              : R.ASSETS_SVG_IC_ROWUPBLACK_SVG,
                                          color:
                                              controller.index.value == 1 ? colorSemanticRed100 : colorNeutralGray90)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: controller.index.value == 1 ? colorSemanticRed100 : Colors.transparent,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                      ),
                                      height: 4,
                                      width: 45,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (controller.listBooks.value.length > 0)
                    Expanded(
                      child: Obx(
                        () => SmartRefresher(
                          controller: controller.refreshController!,
                          header: WaterDropHeader(),
                          footer: ClassicFooter(),
                          enablePullDown: false,
                          enablePullUp: true,
                          onRefresh: () => print("onRefresh"),
                          onLoading: () => controller.onLoading(),
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: controller.listBooks.value.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.43, crossAxisCount: 2, crossAxisSpacing: 0.0, mainAxisSpacing: 0.0),
                            itemBuilder: (BuildContext context, int index) {
                              final purchase = controller.listBooks[index].purchasePackages;
                              PurchasePackagesModel? purchasePackages;
                              if (purchase != null && purchase.length > 0) {
                                purchasePackages = purchase.first;
                              }
                              final author = controller.listBooks[index].authors;
                              AuthorModel? au;
                              if (author != null && author.length > 0) {
                                au = author.first;
                              }

                              return GestureDetector(
                                onTap: () => controller.toNatiDetail(controller.listBooks[index].id),
                                child: Container(
                                  width: (MediaQuery.of(context).size.width - 64) / 2,
                                  // height: 340,
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      color: colorWhite,
                                      boxShadow: boxShadow),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Container(
                                    // height: ,
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
                                                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                              ),
                                              child: AppNetworkImage(
                                                source: controller.listBooks[index].cover ?? "",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            controller.listBooks[index].title ?? "",
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
                                              style: typoRegular12.copyWith(color: colorNeutralGray40),
                                              textAlign: TextAlign.left,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                        //             Wrap(
                                        //   children: controller.listBooks[index]
                                        //       .specifyCategories!
                                        //       .take(1)
                                        //       .map((e2) => Row(
                                        //             children: [
                                        //               Expanded(
                                        //                 flex: 4,
                                        //                 child: Container(
                                        //                     margin:
                                        //                         EdgeInsets.symmetric(
                                        //                             vertical: 4,
                                        //                             horizontal: 8),
                                        //                     padding:
                                        //                         EdgeInsets.symmetric(
                                        //                             vertical: 4,
                                        //                             horizontal: 8),
                                        //                     decoration: BoxDecoration(
                                        //                       borderRadius:
                                        //                           BorderRadius.all(
                                        //                               Radius.circular(
                                        //                                   50)),
                                        //                       color:
                                        //                           colorSemanticBlue20,
                                        //                     ),
                                        //                     child: Text(
                                        //                       e2.name!,
                                        //                       maxLines: 1,
                                        //                       overflow:
                                        //                           TextOverflow.ellipsis,
                                        //                       style: typoRegular14,
                                        //                     )),
                                        //               ),
                                        //               controller.listBooks[index]
                                        //                               .specifyCategories!
                                        //                               .length -
                                        //                           1 ==
                                        //                       0
                                        //                   ? Container()
                                        //                   : Expanded(
                                        //                       flex: 1,
                                        //                       child: Container(
                                        //                           width: 24,
                                        //                           height: 24,
                                        //                           margin:
                                        //                               EdgeInsets.only(
                                        //                                   right: 8),
                                        //                           padding: EdgeInsets
                                        //                               .symmetric(
                                        //                                   vertical: 4,
                                        //                                   horizontal:
                                        //                                       4),
                                        //                           decoration:
                                        //                               BoxDecoration(
                                        //                             borderRadius:
                                        //                                 BorderRadius
                                        //                                     .all(Radius
                                        //                                         .circular(
                                        //                                             24)),
                                        //                             color:
                                        //                                 colorSemanticBlue20,
                                        //                           ),
                                        //                           child: Text(
                                        //                             "+${controller.listBooks[index].specifyCategories!.length - 1}",
                                        //                             style:
                                        //                                 typoRegular12,
                                        //                           )),
                                        //                     )
                                        //             ],
                                        //           ))
                                        //       .toList(),
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "${controller.listBooks[index].ratingAvg ?? 0}",
                                                style: typoBold12,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(horizontal: 4),
                                                child: Icon(Icons.star, color: Colors.yellow, size: 14),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "(${controller.listBooks[index].totalCountRating.toString()}) xếp hạng",
                                                  style: typoRegular10.copyWith(color: colorNeutralGray40),
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
                                          child: Visibility(
                                            visible: controller.listBooks[index].isFree == false,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 4, left: 8, right: 8),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                      "${numberFormat(controller.listBooks[index].retailPrice ?? 0)} đ",
                                                      style:
                                                          typoLight12.copyWith(decoration: TextDecoration.lineThrough))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Visibility(
                                            visible: controller.listBooks[index].isFree == true,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 4, left: 8, right: 8),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text("",
                                                      style:
                                                          typoLight12.copyWith(decoration: TextDecoration.lineThrough))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // height: 25,
                                          child: controller.listBooks[index].isFree == true
                                              ? Padding(
                                                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Text("Miễn phí",
                                                          style: typoLight14.copyWith(color: colorSemanticGreen100))
                                                    ],
                                                  ),
                                                )
                                              : Padding(
                                                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                          "${formatter.format(controller.listBooks[index].discountPrice ?? 0)} đ",
                                                          style: typoLight14.copyWith(color: colorSemanticRed100))
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
                                            height: 32,
                                            size: 14,
                                            mainColor: controller.listBooks[index].isFree == true
                                                ? colorSemanticGreen100
                                                : colorPrimaryBlue100,
                                            buttonTitle: controller.listBooks[index].isFree == true
                                                ? "Đọc miễn phí"
                                                : controller.listBooks[index].isAllowTrial == true
                                                    ? "Đọc thử"
                                                    : controller.listBooks[index].isAlreadyPurchased == 1
                                                        ? "Đọc tiếp"
                                                        : "xem chi tiết",
                                            onPressed: () async {
                                              if (controller.listBooks[index].isFree == true) {
                                                Get.toNamed(Routes.READ_BOOK, arguments: {
                                                  "id": controller.listBooks[index].id,
                                                  "isFree": controller.listBooks[index].isFree,
                                                });
                                              } else if (controller.listBooks[index].isAlreadyPurchased == 1) {
                                                Get.toNamed(Routes.READ_BOOK, arguments: {
                                                  "id": controller.listBooks[index].id,
                                                  "isAlreadyPurchased": controller.listBooks[index].isAlreadyPurchased,
                                                });
                                              } else if (controller.listBooks[index].isAllowTrial == true) {
                                                Get.toNamed(Routes.READ_BOOK, arguments: {
                                                  "id": controller.listBooks[index].id,
                                                  "isAllowtrail": controller.listBooks[index].isAllowTrial,
                                                  "isAlreadyPurchased": controller.listBooks[index].isAlreadyPurchased,
                                                });
                                              } else {
                                                Get.toNamed(Routes.EBOOK_DETAILS, arguments: {
                                                  "id": controller.listBooks[index].id,
                                                  "isAllowtrail": controller.listBooks[index].isAllowTrial,
                                                  "isAlreadyPurchased": controller.listBooks[index].isAlreadyPurchased,
                                                  "isFree": controller.listBooks[index].isFree,
                                                });
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  else
                    Container(
                      height: 500,
                      child: Center(
                        child: Text("Không có sách này"),
                      ),
                    )
                ],
              ),
            )),
      ),
    );
  }
}

class SideMenuBook extends StatelessWidget {
  final controller = Get.put(ResultSearchEbookController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: colorWhite,
            child: Obx(
              () => ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(
                    height: 36,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bộ lọc',
                        style: typoBold18,
                      ),
                      GestureDetector(onTap: () => Get.back(), child: SvgPicture.asset(R.ASSETS_SVG_IC_CANCEL_SVG)),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    height: 1,
                    decoration: BoxDecoration(
                      color: colorNeutralGray5,
                      boxShadow: boxShadow,
                    ),
                  ),
                  Text(
                    'Theo Lớp',
                    style: typoRegular16.copyWith(color: colorPrimaryBlue100),
                  ),
                  Container(
                    child: GridView.count(
                      childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 4),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: controller.nameClasses
                          .map((e) => GestureDetector(
                                onTap: () {
                                  controller.toggleGrade(e.id);
                                },
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: controller.selectedGrades.contains(e.id)
                                        ? colorPrimaryBlue10
                                        : colorNeutralGray5,
                                    border: Border.all(
                                        width: 1,
                                        color: controller.selectedGrades.contains(e.id)
                                            ? colorPrimaryBlue40
                                            : colorNeutralGray5),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    e.name,
                                    style: typoRegular14.copyWith(
                                        color: controller.selectedGrades.contains(e.id)
                                            ? colorPrimaryBlue100
                                            : colorNeutralGray95),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            controller.nameClasses.length > 4
                                ? controller.tapSeeLessGrade()
                                : controller.tapSemoreGrade();
                          },
                          child: Text(controller.nameClasses.length > 4 ? "Thu gọn" : "Xem thêm",
                              style: typoRegular12.copyWith(color: colorSemanticBlue100)))
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Theo Môn học',
                    style: typoRegular16.copyWith(color: colorPrimaryBlue100),
                  ),
                  Container(
                    child: GridView.count(
                      childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 4),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: controller.listSubjects
                          .map((e) => GestureDetector(
                                onTap: () {
                                  controller.toggleSubject(e.id);
                                },
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: controller.selectedSubjects.contains(e.id)
                                        ? colorPrimaryBlue10
                                        : colorNeutralGray5,
                                    border: Border.all(
                                        width: 1,
                                        color: controller.selectedSubjects.contains(e.id)
                                            ? colorPrimaryBlue40
                                            : colorNeutralGray5),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    e.name,
                                    style: typoRegular14.copyWith(
                                        color: controller.selectedSubjects.contains(e.id)
                                            ? colorPrimaryBlue100
                                            : colorNeutralGray95),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            controller.listSubjects.length > 4
                                ? controller.tapSeeLessSubject()
                                : controller.tapSemoreSubject();
                          },
                          child: Text(controller.listSubjects.length > 4 ? "Thu gọn" : "Xem thêm",
                              style: typoRegular12.copyWith(color: colorSemanticBlue100)))
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Theo Danh mục',
                    style: typoRegular16.copyWith(color: colorPrimaryBlue100),
                  ),
                  Container(
                    child: GridView.count(
                      childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 3),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: controller.listCategories
                          .map((e) => GestureDetector(
                                onTap: () {
                                  controller.toggleCategory(e.id);
                                },
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: controller.selectedCategorys.contains(e.id)
                                        ? colorPrimaryBlue10
                                        : colorNeutralGray5,
                                    border: Border.all(
                                        width: 1,
                                        color: controller.selectedCategorys.contains(e.id)
                                            ? colorPrimaryBlue40
                                            : colorNeutralGray5),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      e.name,
                                      style: typoRegular14.copyWith(
                                          color: controller.selectedCategorys.contains(e.id)
                                              ? colorPrimaryBlue100
                                              : colorNeutralGray95),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            controller.listCategories.length > 4
                                ? controller.tapSeeLessCategory()
                                : controller.tapSemoreCategory();
                          },
                          child: Text(controller.listCategories.length > 4 ? "Thu gọn" : "Xem thêm",
                              style: typoRegular12.copyWith(color: colorSemanticBlue100)))
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Theo nhà xuất bản',
                    style: typoRegular16.copyWith(color: colorPrimaryBlue100),
                  ),
                  Container(
                    child: GridView.count(
                      childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 3),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: controller.listAuthor
                          .map((e) => GestureDetector(
                                onTap: () {
                                  controller.toggleSubject(e.id);
                                },
                                child: Container(
                                    margin: EdgeInsets.all(8),
                                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: controller.selectedSubjects.contains(e.id)
                                          ? colorPrimaryBlue10
                                          : colorNeutralGray5,
                                      border: Border.all(
                                          width: 1,
                                          color: controller.selectedSubjects.contains(e.id)
                                              ? colorPrimaryBlue40
                                              : colorNeutralGray5),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        e.name,
                                        style: typoRegular14.copyWith(
                                            color: controller.selectedSubjects.contains(e.id)
                                                ? colorPrimaryBlue100
                                                : colorNeutralGray95),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )),
                              ))
                          .toList(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            controller.listAuthor.length > 4
                                ? controller.tapSeeLessPublisher()
                                : controller.tapSemorePublisher();
                          },
                          child: Text(controller.listAuthor.length > 4 ? "Thu gọn" : "Xem thêm",
                              style: typoRegular12.copyWith(color: colorSemanticBlue100)))
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 3 / 4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: boxShadow,
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: styleButtonWhiteBorder,
                        child: Text("Hủy bỏ"),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Obx(() => ElevatedButtonBase(
                            state: controller.selectedGrades.value.length > 0 ||
                                    controller.selectedAuthors.value.length > 0 ||
                                    controller.selectedSubjects.value.length > 0 ||
                                    controller.selectedCategorys.value.length > 0
                                ? AppElevatedButtonState.active
                                : AppElevatedButtonState.inactive,
                            height: 40,
                            size: 14,
                            weight: FontWeight.w700,
                            buttonTitle: "Áp dụng",
                            onPressed: () async {
                              await controller.tapSubmit();
                            },
                          )),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
