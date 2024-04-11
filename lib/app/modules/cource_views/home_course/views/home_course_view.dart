import 'package:cached_network_image/cached_network_image.dart';
import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/modules/cource_views/home_course/controllers/home_course_controller.dart';
import 'package:elearning/app/modules/main_screen/home/views/home_view.dart';
import 'package:elearning/app/modules/main_screen/main/views/main_view.dart';
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
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeCourseView extends GetView<HomeCourseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(R.ASSETS_SVG_IC_BACK_BLACK_SVG),
          ),
        ),
        title: Text(
          "Khóa học",
          style: typoBold24,
        ),
        centerTitle: true,
      ),
      backgroundColor: colorWhite,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchCourse(),
              SizedBox(
                height: 16,
              ),
              BannerCourse(),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: Text("Cấp học", style: typoBold24),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.bottomSheet(SchoolLevelBottomSheet(
                          title: "Tiểu học",
                          listGrade: [
                            "Lớp 1",
                            "Lớp 2",
                            "Lớp 3",
                            "Lớp 4",
                            "Lớp 5"
                          ],
                        ));
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: colorPrimaryBlue5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(R.ASSETS_SVG_IC_PRIMARYSCHOOL_SVG),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Tiểu học',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.bottomSheet(SchoolLevelBottomSheet(
                          title: "THCS",
                          listGrade: ["Lớp 6", "Lớp 7", "Lớp 8", "Lớp 9"],
                        ));
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: colorPrimaryBlue5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                R.ASSETS_SVG_IC_SECONDARYSCHOOL_SVG),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'THCS',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.bottomSheet(SchoolLevelBottomSheet(
                          title: "THPT",
                          listGrade: ["Lớp 10", "Lớp 11", "Lớp 12"],
                        ));
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: colorPrimaryBlue5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(R.ASSETS_SVG_IC_HIGHSCHOLL_SVG),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'THPT',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SubjectCourse(),
              ListCourseCategory(),
              news(context)
            ],
          ),
        ),
      ),
    );
  }

  news(BuildContext context) => Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tin tức", style: typoBold20),
                  SizedBox(
                    width: 16,
                  ),
                  TextButton(
                    onPressed: () async {
                      await controller.tapSemoreNews("Tin tức");
                    },
                    child: Text(
                      "Xem thêm",
                      style: typoRegular14.copyWith(
                          color: colorSemanticBlue100,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            controller.news.length > 0
                ? Container(
                    height: 270,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.news.length,
                      itemBuilder: (context, e) {
                        final time = controller.news[e].updatedAt;
                        return GestureDetector(
                          onTap: () {
                            controller.detailNews(controller.news.value[e].id);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 120,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: colorWhite,
                                boxShadow: boxShadow),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                    source: controller.news[e].thumbnail ?? "",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                
                                    children: [
                                      Container(
                                        width: 110,
                                        child: Text(controller.news[e].author ?? "",
                                            style: typoRegular12.copyWith(
                                                color: colorNeutralGray600),overflow: TextOverflow.ellipsis,),
                                      ),
                                      Text(fullStringTimeFormat(time),
                                          style: typoRegular12.copyWith(
                                              color: colorNeutralGray600),
                                        )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8, left: 8, right: 8),
                                  child: Text(
                                    controller.news[e].title ?? "",
                                    style: typoLight12,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Center(child: CircularProgressIndicator())
          ],
        ),
      );
}

class BannerCourse extends StatelessWidget {
  final controller = Get.find<HomeCourseController>();

  BannerCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.appbanners.length > 0
          ? Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 100,
                        aspectRatio: 2.0,
                        initialPage: 0,
                        onPageChanged: (index, reason) {
                          controller.setSliderTopIndex(index);
                        }),
                    items: controller.appbanners.map(
                      (obj) {
                        return Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                              onTap:
                                  obj.linkDirect == null || obj.linkDirect == ""
                                      ? null
                                      : () {
                                          launch(obj.linkDirect ?? "");
                                        },
                              child: Container(
                                width: MediaQuery.of(context).size.width -
                                    15.98 * 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.98),
                                  child: AppNetworkImage(
                                    source: obj.source ?? '',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: controller.appbanners.map(
                        (element) {
                          if (controller.appbanners.indexOf(element) ==
                              controller.sliderTopIndex.value) {
                            return Container(
                              width: 8,
                              height: 8,
                              margin: EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                color: colorSemanticRed100,
                              ),
                            );
                          }
                          return Container(
                            width: 8,
                            height: 8,
                            margin: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              color: colorNeutralGray40,
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                )
              ],
            )
          : Container(),
    );
  }
}

class MidBanner extends StatelessWidget {
  final controller = Get.find<HomeCourseController>();

  MidBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.listSlides.length > 0
          ? Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 100,
                        aspectRatio: 2.0,
                        initialPage: 0,
                        onPageChanged: (index, reason) {
                          controller.setSliderIndex(index);
                        }),
                    items: controller.listSlides.map(
                      (obj) {
                        return Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                              onTap:
                                  obj.linkDirect == null || obj.linkDirect == ""
                                      ? null
                                      : () {
                                          launch(obj.linkDirect ?? "");
                                        },
                              child: Container(
                                width: MediaQuery.of(context).size.width -
                                    15.98 * 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.98),
                                  child: AppNetworkImage(
                                    source: obj.source ?? '',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: controller.listSlides.map(
                        (element) {
                          if (controller.listSlides.indexOf(element) ==
                              controller.sliderIndex.value) {
                            return Container(
                              width: 8,
                              height: 8,
                              margin: EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                                color: colorSemanticRed100,
                              ),
                            );
                          }
                          return Container(
                            width: 8,
                            height: 8,
                            margin: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              color: colorNeutralGray40,
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                )
              ],
            )
          : Container(),
    );
  }
}

class SubjectCourse extends StatelessWidget {
  final controller = Get.find<HomeCourseController>();

  SubjectCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8),
            child: Text("Môn học", style: typoBold24),
          ),
          SizedBox(
            height: 16,
          ),
          controller.listCategoryCourse.length > 0
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: 136,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.listCategoryCourse.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.RESULT_SEARCH, arguments: {
                            "categoryIds":
                                controller.listCategoryCourse[index].id ?? 0
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 16),
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                padding: EdgeInsets.all(16),
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  boxShadow: boxShadow,
                                  color: colorGreyBlue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35)),
                                ),
                                child: SvgPicture.asset(
                                  R.ASSETS_SVG_IC_MATH_SVG,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                width: 90,
                                child: Text(
                                  controller.listCategoryCourse[index].name ??
                                      "",
                                  maxLines: 3,
                                  textAlign: TextAlign.center,
                                  style: typoLight14,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(child: CircularProgressIndicator()),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

class ListCourseCategory extends StatelessWidget {
  final controller = Get.find<HomeCourseController>();
  ListCourseCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        courseIsHighlight(context),
        courseIsDiscount(context),
        MidBanner(),
        courseNewest(context),
        courseFree(context)
      ],
    );
  }

  courseFree(BuildContext context) => Obx(
        () => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Khóa học miễn phí", style: typoBold24),
                SizedBox(
                  width: 16,
                ),
                TextButton(
                  onPressed: () async {
                    await controller.tapSemore(
                        "Khóa học miễn phí", null, "ASC", false, true, false);
                  },
                  child: Text(
                    "Xem thêm",
                    style: typoRegular14.copyWith(
                        color: colorSemanticBlue100,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          controller.listFree.length > 0
              ? Container(
                  height: 320,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.listFree.length,
                    itemBuilder: (context, id) => GestureDetector(
                      onTap: () =>
                          controller.toNatiDetail(controller.listFree[id]),
                      child: Container(
                        width: (MediaQuery.of(context).size.width - 64) / 2,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: colorWhite,
                            boxShadow: boxShadow),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 92,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                  ),
                                  child: AppNetworkImage(
                                    source:
                                        controller.listFree[id].avatar ?? "",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                    left: 16,
                                    top: 8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (controller.listFree[id]
                                                .discountPercentage ==
                                            false)
                                          Container(
                                            width: 40,
                                            height: 20,
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(16),
                                              ),
                                              color: colorSemanticRed100,
                                            ),
                                            child: Text(
                                              '-${controller.listFree[id].discountPercentage ?? -50}' +
                                                  "%",
                                              style: typoSemiBold10.copyWith(
                                                  color: colorWhite,
                                                  fontSize: 8),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        else
                                          SizedBox(height: 8),
                                        SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(controller.listFree[id].title ?? "",
                                  style: typoLight14Course,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Container(
                              height: 60,
                              child: Html(
                                data:
                                    controller.listFree[id].briefDescription ??
                                        "",
                                style: {
                                  '#': Style(
                                    color: colorNeutralGray60,
                                    fontSize: FontSize(12),
                                    maxLines: 3,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                },
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 25,
                              child: Visibility(
                                visible:
                                    controller.listFree[id].isFree == false,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8, left: 8, right: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                          "${controller.listFree[id].retailPrice ?? 0} đ",
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
                              child: controller.listFree[id].isFree == true
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 8, left: 8, right: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                              "${formatter.format(controller.listFree[id].price ?? 0)} đ",
                                              style: typoLight14.copyWith(
                                                  color: colorSemanticRed100))
                                        ],
                                      ),
                                    ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              child: ElevatedButtonBase(
                                mainColor:
                                    controller.listFree[id].isFree == true
                                        ? colorSemanticGreen100
                                        : colorPrimaryBlue100,
                                height: 32,
                                size: 14,
                                buttonTitle:
                                    controller.listFree[id].isFree == true
                                        ? "Học miễn phí"
                                        : "Học thử",
                                onPressed: () async {
                                  controller
                                      .toNatiDetail(controller.listFree[id]);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Center(child: CircularProgressIndicator())
        ]),
      );

  courseNewest(BuildContext context) => Obx(
        () => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Khóa học mới nhất", style: typoBold24),
                TextButton(
                  onPressed: () async {
                    await controller.tapSemore(
                        "Khóa học mới nhất", null, "ASC", false, false, false);
                  },
                  child: Text(
                    "Xem thêm",
                    style: typoRegular14.copyWith(
                        color: colorSemanticBlue100,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          controller.listNewest.length > 0
              ? Wrap(
                  children: controller.listNewest
                      .map(
                        (e) => GestureDetector(
                          onTap: () => controller.toNatiDetail(e),
                          child: Container(
                            width: (MediaQuery.of(context).size.width - 64) / 2,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
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
                                      height: 92,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8)),
                                      ),
                                      child: AppNetworkImage(
                                        source: e.avatar ?? "",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                        left: 16,
                                        top: 8,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            e.discountPercentage != null &&
                                                    e.isFree == false
                                                ? Container(
                                                    width: 40,
                                                    height: 20,
                                                    padding: EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(16),
                                                      ),
                                                      color:
                                                          colorSemanticRed100,
                                                    ),
                                                    child: Text(
                                                      '-${e.discountPercentage ?? -50}' +
                                                          "%",
                                                      style: typoSemiBold10
                                                          .copyWith(
                                                              color: colorWhite,
                                                              fontSize: 8),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )
                                                : SizedBox(height: 8),
                                            SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(e.title ?? "",
                                      style: typoLight14Course,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                Container(
                                  height: 60,
                                  child: Html(
                                    data: e.briefDescription ?? "",
                                    style: {
                                      '#': Style(
                                        color: colorNeutralGray60,
                                        fontSize: FontSize(12),
                                        maxLines: 3,
                                        textOverflow: TextOverflow.ellipsis,
                                      ),
                                    },
                                  ),
                                ),
                                Container(
                                  // height: 30,
                                  child: Visibility(
                                    visible: e.isFree == false,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4, left: 8, right: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text("${e.retailPrice ?? 0} đ",
                                              style: typoBold12.copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                letterSpacing: 0.0,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                e.isFree == true
                                    ? SizedBox(
                                        height: 16,
                                      )
                                    : Container(),
                                Container(
                                  // height: 30,
                                  child: e.isFree == true
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4, left: 8, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text("Miễn phí",
                                                  style: typoLight14.copyWith(
                                                      color:
                                                          colorSemanticGreen100))
                                            ],
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4, left: 8, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                  "${formatter.format(e.price ?? 0)} đ",
                                                  style: typoBold14.copyWith(
                                                    color: colorSemanticRed100,
                                                    letterSpacing: 0.0,
                                                  ))
                                            ],
                                          ),
                                        ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 8),
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
                                        ? "Học miễn phí"
                                        : e.isAlreadyPurchased == 1
                                            ? "Học tiếp"
                                            : e.isAllowTrial == 1
                                                ? "Học thử"
                                                : "Xem chi tiết",
                                    onPressed: () async {
                                      if (e.isFree == true ||
                                          e.isAlreadyPurchased == 1) {
                                        controller.toNatiCouseLern(e.id ?? 0);
                                      } else if (e.isAllowTrial == 1) {
                                        controller
                                            .toNatiCouseLernTrail(e.id ?? 0);
                                      } else {
                                        controller.toNatiDetail(e);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )
              : Center(child: CircularProgressIndicator()),
        ]),
      );

  courseIsDiscount(BuildContext context) => Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text("Khóa học khuyến mại", style: typoBold24),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  TextButton(
                    onPressed: () async {
                      await controller.tapSemore("Khóa học khuyến mại",
                          "discountPercentage", "ASC", false, false, true);
                    },
                    child: Text(
                      "Xem thêm",
                      style: typoRegular14.copyWith(
                          color: colorSemanticBlue100,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            controller.listDiscount.length > 0
                ? Container(
                    height: 300,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.listDiscount.length,
                      itemBuilder: (context, id) => GestureDetector(
                          onTap: () => controller
                              .toNatiDetail(controller.listDiscount[id]),
                          child: Container(
                            width: (MediaQuery.of(context).size.width - 64) / 2,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
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
                                      height: 92,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8)),
                                      ),
                                      child: AppNetworkImage(
                                        source: controller
                                                .listDiscount[id].avatar ??
                                            "",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                        left: 16,
                                        top: 8,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            controller.listDiscount[id]
                                                            .discountPercentage !=
                                                        null &&
                                                    controller.listDiscount[id]
                                                            .isFree ==
                                                        false
                                                ? Container(
                                                    width: 40,
                                                    height: 20,
                                                    padding: EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(16),
                                                      ),
                                                      color:
                                                          colorSemanticRed100,
                                                    ),
                                                    child: Text(
                                                      '-${controller.listDiscount[id].discountPercentage ?? -50}' +
                                                          "%",
                                                      style: typoSemiBold10
                                                          .copyWith(
                                                              color: colorWhite,
                                                              fontSize: 8),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )
                                                : Container(
                                                    width: 40,
                                                    height: 20,
                                                    padding: EdgeInsets.all(4),
                                                    child: Text(
                                                      "",
                                                      style: typoSemiBold10
                                                          .copyWith(
                                                              color: colorWhite,
                                                              fontSize: 8),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      controller.listDiscount[id].title ?? "",
                                      style: typoLight14Course,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                Container(
                                  height: 60,
                                  child: Html(
                                    data: controller.listDiscount[id]
                                            .briefDescription ??
                                        "",
                                    style: {
                                      '#': Style(
                                        color: colorNeutralGray60,
                                        fontSize: FontSize(12),
                                        maxLines: 3,
                                        textOverflow: TextOverflow.ellipsis,
                                      ),
                                    },
                                  ),
                                ),
                                Container(
                                  // height: 30,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4, left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Flexible(
                                          child: Text(
                                              "${formatter.format(controller.listDiscount[id].retailPrice ?? 0)} đ",
                                              overflow: TextOverflow.ellipsis,
                                              style: typoBold12.copyWith(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                letterSpacing: 0.0,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  // height: 30,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4, left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                            "${formatter.format(controller.listDiscount[id].price ?? 0)} đ",
                                            style: typoBold14.copyWith(
                                              color: colorSemanticRed100,
                                              letterSpacing: 0.0,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                  ),
                                  child: ElevatedButtonBase(
                                    mainColor: colorPrimaryBlue100,
                                    height: 32,
                                    size: 14,
                                    buttonTitle: controller.listDiscount[id]
                                                .isAlreadyPurchased ==
                                            1
                                        ? "Học tiếp"
                                        : controller.listDiscount[id]
                                                    .isAllowTrial ==
                                                1
                                            ? "Học thử "
                                            : "Xem chi tiết",
                                    onPressed: () async {
                                      if (controller.listDiscount[id].isFree ==
                                              true ||
                                          controller.listDiscount[id]
                                                  .isAlreadyPurchased ==
                                              1) {
                                        controller.toNatiCouseLern(
                                            controller.listDiscount[id].id ??
                                                0);
                                      } else if (controller
                                              .listDiscount[id].isAllowTrial ==
                                          1) {
                                        controller.toNatiCouseLernTrail(
                                            controller.listDiscount[id].id ??
                                                0);
                                      } else {
                                        controller.toNatiDetail(
                                            controller.listDiscount[id]);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
          ],
        ),
      );

  courseIsHighlight(BuildContext context) => Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Khóa học nổi bật", style: typoBold24),
                  SizedBox(
                    width: 16,
                  ),
                  TextButton(
                    onPressed: () async {
                      await controller.tapSemore(
                          "Khóa học nổi bật", null, "ASC", true, false, false);
                    },
                    child: Text(
                      "Xem thêm",
                      style: typoRegular14.copyWith(
                          color: colorSemanticBlue100,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            controller.listHighlight.length > 0
                ? Wrap(
                    children: controller.listHighlight.value
                        .map(
                          (e) => GestureDetector(
                              onTap: () => controller.toNatiDetail(e),
                              child: Container(
                                width:
                                    (MediaQuery.of(context).size.width - 64) /
                                        2,
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
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
                                          height: 92,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8)),
                                          ),
                                          child: AppNetworkImage(
                                            source: e.avatar ?? "",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                            left: 16,
                                            top: 8,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                e.discountPercentage != null &&
                                                        e.isFree == false
                                                    ? Container(
                                                        width: 40,
                                                        height: 20,
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(16),
                                                          ),
                                                          color:
                                                              colorSemanticRed100,
                                                        ),
                                                        child: Text(
                                                          '-${e.discountPercentage ?? -50}' +
                                                              "%",
                                                          style: typoSemiBold10
                                                              .copyWith(
                                                                  color:
                                                                      colorWhite,
                                                                  fontSize: 8),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      )
                                                    : SizedBox(height: 8),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e.title ?? "",
                                          style: typoLight14Course,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    Container(
                                      height: 60,
                                      child: Visibility(
                                        child: Html(
                                          data: e.briefDescription ?? "",
                                          style: {
                                            '#': Style(
                                              color: colorNeutralGray60,
                                              fontSize: FontSize(12),
                                              maxLines: 3,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                            ),
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // height: 30,
                                      child: e.isFree == false
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4, left: 8, right: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                        "${formatter.format(e.retailPrice ?? 0)} đ",
                                                        style:
                                                            typoBold12.copyWith(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          letterSpacing: 0.0,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            )
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4, left: 8, right: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Flexible(
                                                    child: Text("",
                                                        style:
                                                            typoBold12.copyWith(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          letterSpacing: 0.0,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                    ),
                                    Container(
                                      // height: 30,
                                      child: e.isFree == true
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4, left: 8, right: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text("Miễn phí",
                                                      style: typoBold14.copyWith(
                                                          color:
                                                              colorSemanticGreen100))
                                                ],
                                              ),
                                            )
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4, left: 8, right: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                      "${formatter.format(e.price ?? 0)} đ",
                                                      style: typoBold14.copyWith(
                                                          color:
                                                              colorSemanticRed100,
                                                          letterSpacing: 0.0))
                                                ],
                                              ),
                                            ),
                                    ),
                                    // SizedBox(
                                    //   height: 8,
                                    // ),
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
                                            ? "Học miễn phí"
                                            : e.isAlreadyPurchased == 1
                                                ? "Học tiếp"
                                                : e.isAllowTrial == 1
                                                    ? "Học thử"
                                                    : "Xem chi tiết",
                                        onPressed: () async {
                                          if (e.isFree == true ||
                                              e.isAlreadyPurchased == 1) {
                                            controller
                                                .toNatiCouseLern(e.id ?? 0);
                                          } else if (e.isAllowTrial == 1) {
                                            controller.toNatiCouseLernTrail(
                                                e.id ?? 0);
                                          } else {
                                            controller.toNatiDetail(e);
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        )
                        .toList(),
                  )
                : Center(child: CircularProgressIndicator()),
          ],
        ),
      );
}

class SearchCourse extends StatelessWidget {
  final controller = Get.find<HomeCourseController>();
  SearchCourse({
    Key? key,
  }) : super(key: key);

  // final void Function(Map<String, String>) onSelectSearchView;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.0, right: 8),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                controller.tapSearch();
              },
              child: Container(
                height: 48,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: colorWhite,
                    boxShadow: boxShadow),
                child: Row(
                  children: [
                    SvgPicture.asset(R.ASSETS_SVG_IC_SEARCH_24_SVG),
                    SizedBox(width: 8),
                    Text("Nhập tên khóa học ...", style: typoRegular12),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: colorWhite,
                boxShadow: boxShadow),
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

class SchoolLevelBottomSheet extends StatelessWidget {
  // final controller = Get.find<ProfileController>();
  const SchoolLevelBottomSheet({
    Key? key,
    required this.title,
    required this.listGrade,
  }) : super(key: key);
  final List listGrade;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decorContainerBox,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: decorContainerBox,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Chọn lớp học',
                  style: typoRegular18,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  title,
                  style: typoRegular14,
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 16,
                        children: listGrade
                            .map(
                              (e) => GestureDetector(
                                onTap: () {
                                  final grade =
                                      int.parse(e.split(' ')[1].trim());
                                  Get.back();
                                  Get.toNamed(Routes.RESULT_SEARCH,
                                      arguments: {"grade": grade});
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 16),
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    ),
                                    color: colorNeutralGray5,
                                  ),
                                  child: Text(
                                    e,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: boxShadow,
              ),
              padding: EdgeInsets.all(20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: styleButtonBLueBorder.copyWith(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(colorWhite),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            typoRegular14.copyWith(fontSize: 16),
                          ),
                        ),
                        onPressed: () async {
                          Get.back();
                        },
                        child: Text("Hủy bỏ"),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
