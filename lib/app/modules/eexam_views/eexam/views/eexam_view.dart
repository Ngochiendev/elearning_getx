import 'package:carousel_slider/carousel_slider.dart';
import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/modules/ebook_views.dart/ebook/controllers/ebook_controller.dart';
import 'package:elearning/app/modules/eexam_views/eexam/controllers/eexam_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:url_launcher/url_launcher.dart';

class EexamView extends GetView<EexamController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EexamController>();
    return Scaffold(
      backgroundColor: Color(0xFFFCF4F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: colorBlack,
        ),
        title: Text(
          "Đấu trường thi online",
          style: typoBold24,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 6),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchExam(),
              SizedBox(
                height: 16,
              ),
              BannerExam(),
              SizedBox(
                height: 16,
              ),
              ListExam(),
              news(context)
            ],
          ),
        ),
      ),
    );
  }

  news(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tin tức",
                style: typoBold20,
              ),
              SizedBox(
                width: 16,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Xem thêm",
                    style: typoBold14.copyWith(
                      color: colorSemanticBlue100,
                      decoration: TextDecoration.underline,
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 120,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)), color: colorWhite, boxShadow: boxShadow),
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
                            topRight: Radius.circular(8),
                          )),
                          child: AppNetworkImage(
                            source: '${baseUrlImage}c5oojc9e0mdd1brga5og.jpg',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Hoàng Anh",
                                  style: typoRegular14.copyWith(
                                    color: colorNeutralGray600,
                                  )),
                              TextSpan(text: "   "),
                              TextSpan(text: "02/12/2021", style: typoRegular14.copyWith(color: colorNeutralGray90))
                            ]),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 8,
                            left: 8,
                            right: 8,
                          ),
                          child: Text("Smartschool tham gia ngày hội CNTT ngành GD&ĐT Hà Nội lần thứ V"),
                        )
                      ],
                    ),
                  ),
                );
              },
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      );
}

class ListExam extends StatelessWidget {
  final controiler = Get.find<EexamController>();
  //const ListExam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        examNow(context),
        Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: AppNetworkImage(
              source: '${baseUrlImage}c5oojc9e0mdd1brga5og.jpg',
              fit: BoxFit.cover,
            ),
          ),
          width: MediaQuery.of(context).size.width,
        ),
        examComing(context),
      ],
    );
  }

  examNow(BuildContext context) => Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  "Các bài thi đang  diễn  ra",
                  style: typoBold20,
                )),
                SizedBox(
                  width: 16,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Xem thêm",
                    style: typoRegular14.copyWith(color: colorSemanticBlue100, decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            controiler.listdoing.length > 0
                ? Wrap(
                    children: controiler.listdoing
                        .map((item) => Container(
                              height: 390,
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.EXAM_DETAIL);
                                },
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
                                            height: 92,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8),
                                              ),
                                            ),
                                            child: AppNetworkImage(
                                              source: item.avatar,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          child: Center(
                                              child: Text(
                                            "Đang diễn ra",
                                            style: TextStyle(
                                                fontSize: 9,
                                                color: colorSemanticGreen100,
                                                fontWeight: (FontWeight.bold)),
                                          )),
                                          width: 69,
                                          height: 18,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            color: colorSemanticGreen60,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          item.title ?? "Kiểm tra cuối kỳ 2 Vật lý lớp 7",
                                          style: typoBold16,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(R.ASSETS_SVG_IC_CLOCK_RED_SVG),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text("${item.exercise!.duration.toString()} phút"),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(R.ASSETS_SVG_IC_CLOCK_BLUE_SVG),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "${item.totalQuestions ?? 0 + item.totalConfigQuestions} câu hỏi ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 13),
                                        child: Align(
                                            alignment: Alignment.topRight,
                                            child: item.purchasePackages != null && item.purchasePackages?.length != 0
                                                ? Text(
                                                    "${item.purchasePackages!.first.retailPrice ?? 0} đ",
                                                    style: TextStyle(decoration: TextDecoration.lineThrough),
                                                  )
                                                : Text(
                                                    "",
                                                    style: TextStyle(decoration: TextDecoration.lineThrough),
                                                  )),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 13),
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          "200.000 đ/3 lượt",
                                          style: typoRegular14Redd,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width,
                                              //margin: EdgeInsets.all(0),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(16)),
                                              ),
                                              child: ElevatedButtonBase(
                                                //titleColor: ,
                                                mainColor: colorSemanticRed100,
                                                height: 32,
                                                size: 14,
                                                buttonTitle: "Mua lượt thi",
                                                onPressed: () {},
                                                //child: null,
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width,
                                              margin: EdgeInsets.all(0),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(16)),
                                              ),
                                              child: OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(10))),
                                                    side: BorderSide(color: Colors.blue, width: 3)),
                                                //titleColor: ,
                                                // mainColor: colorSemanticRed100,
                                                // height: 32,
                                                // size: 14,
                                                // buttonTitle: "Mua lượt thi",
                                                onPressed: () {},
                                                child: Text("Thêm vào giỏ"),
                                                //child: null,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))
                        .toList())
                : Center(),
          ],
        ),
      );

  examComing(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                "Các bài thi sắp tới",
                style: typoBold20,
              )),
              SizedBox(
                width: 16,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Xem  thêm",
                  style: typoRegular14.copyWith(color: colorSemanticBlue100, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Obx(
            () => controiler.listfuture.length > 0
                ? Wrap(
                    children: controiler.listfuture
                        .map((item) => Container(
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
                                          height: 92,
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8),
                                            ),
                                          ),
                                          child: AppNetworkImage(
                                            source: item.avatar ?? '${baseUrlImage}c5oojc9e0mdd1brga5og.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Center(
                                              child: Text(
                                                "Sắp tới",
                                                style: TextStyle(
                                                  fontSize: 9,
                                                  color: colorSemanticBlue100,
                                                  fontWeight: (FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            width: 45,
                                            height: 18,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(16),
                                              color: colorSemanticBlue20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 8),
                                      child: Text("02/02/1999"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        item.title ?? "",
                                        style: typoBold16,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(R.ASSETS_SVG_IC_CLOCK_RED_SVG),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text("30 phút"),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(R.ASSETS_SVG_IC_CLOCK_BLUE_SVG),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text('${item.totalQuestions ?? 0 + item.totalConfigQuestions} câu hỏi'),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 13),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          "800.000 đ",
                                          style: TextStyle(decoration: TextDecoration.lineThrough),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 13),
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        "200.000 đ/3 lượt",
                                        style: typoRegular14Redd,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            //margin: EdgeInsets.all(0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(16)),
                                            ),
                                            child: ElevatedButtonBase(
                                              //titleColor: ,
                                              mainColor: colorSemanticRed100,
                                              height: 32,
                                              size: 14,
                                              buttonTitle: "Mua lượt thi",
                                              onPressed: () {},
                                              //child: null,
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            margin: EdgeInsets.all(0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(16)),
                                            ),
                                            child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(10))),
                                                  side: BorderSide(color: Colors.blue, width: 3)),
                                              //titleColor: ,
                                              // mainColor: colorSemanticRed100,
                                              // height: 32,
                                              // size: 14,
                                              // buttonTitle: "Mua lượt thi",
                                              onPressed: () {},
                                              child: Text("Thêm vào giỏ"),
                                              //child: null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList())
                : Center(child: CircularProgressIndicator()),
          ),
        ],
      );
}

class SearchExam extends StatelessWidget {
  final controller = Get.find<EexamController>();
  SearchExam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                controller.tapSearchExam();
              },
              child: Container(
                height: 48,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)), color: colorWhite, boxShadow: boxShadow),
                child: Row(
                  children: [
                    SvgPicture.asset(R.ASSETS_SVG_IC_SEARCH_24_SVG),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Nhập tên bài thi...",
                      style: typoRegular14.copyWith(color: colorNeutralGray60),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)), color: colorWhite, boxShadow: boxShadow),
            child: ElevatedButton(
              child: SvgPicture.asset(R.ASSETS_SVG_IC_CART_SVG),
              style: styleButtonWhite,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

class BannerExam extends StatelessWidget {
  final controller = Get.find<EexamController>();
  BannerExam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.appbaner.length > 0
        ? Stack(
            children: [
              Container(
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.94,
                      aspectRatio: 2.0,
                      initialPage: 0,
                      onPageChanged: (index, reason) {
                        controller.setSliderIndex(index);
                      }),
                  items: controller.appbaner.map((obj) {
                    return Builder(builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          launch(obj.linkDirect ?? "");
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width - 15.98 * 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.98),
                            child: AppNetworkImage(
                              source: obj.source,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    });
                  }).toList(),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.listSlides.map((element) {
                      if (controller.listSlides.value.indexOf(element) == controller.sliderIndex.value) {
                        return Container(
                          width: 8,
                          height: 8,
                          margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            color: colorSemanticRed100,
                          ),
                        );
                      }
                      return Container(
                        width: 8,
                        height: 8,
                        margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: colorNeutralGray40,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          )
        : Center(
            child: CircularProgressIndicator(),
          ));
    // return Obx(
    //     () => controller.listSlides.length > 0
    //         ? Stack(
    //      children: [
    //          Container(
    //          width: double.infinity,
    //          child: CarouselSlider(
    //            options: CarouselOptions(
    //              autoPlay: true,
    //              enlargeCenterPage: true,
    //              viewportFraction: 0.94,
    //              aspectRatio:  2.0,
    //              initialPage: 0,
    //              onPageChanged: (index,reason){
    //                controller.setSliderIndex(index);
    //              }),
    //            items: [1,2,3].map(
    //                (obj){
    //                  return Builder(
    //                      builder: (BuildContext context){
    //                        return Container(
    //                          width: MediaQuery.of(context).size.width - 15.98* 2,
    //                          child: ClipRRect(
    //                            borderRadius: BorderRadius.circular(15.98),
    //                            child: AppNetworkImage(
    //                              source: '$baseUrlImagec5oojc9e0mdd1brga5og.jpg',
    //                              fit: BoxFit.cover,
    //                            ),
    //                          ),
    //                        );
    //                      }
    //                  );
    //                }
    //
    //            ).toList(),
    //          ),
    //        ),
    //           Positioned(
    //             bottom: 0,
    //             left: 0,
    //             right: 0,
    //             child: Center(
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: controller.listSlides.map(
    //                         (element) {
    //                           if  (controller.listSlides.value.indexOf(element) == controller.sliderIndex.value){
    //                             return Container(
    //                               width: 8,
    //                               height: 8,
    //                               margin: EdgeInsets.symmetric(
    //                                 vertical: 16.0,horizontal: 4.0),
    //                               decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.all(Radius.circular(6)),
    //                                 color: colorSemanticRed100,
    //                               ),
    //                             );
    //                           }
    //                           return Container(
    //                             width: 8,
    //                             height: 8,
    //                             margin: EdgeInsets.symmetric(
    //                               vertical: 16.0,horizontal: 4.0),
    //                                decoration: BoxDecoration(
    //                                  borderRadius: BorderRadius.all(Radius.circular(4)),
    //                                  color: colorNeutralGray40,
    //                                ),
    //                           );
    //                         }).toList(),
    //               ),
    //             ),
    //           )
    //      ],
    //     )
    //     : Center(child: CircularProgressIndicator(),)
    // );
  }
}
