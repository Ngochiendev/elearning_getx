import 'dart:math';

import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:path/path.dart';

import '../controllers/exam_detail_controller.dart';

class ExamDetailView extends GetView<ExamDetailController> {
  final controiller = Get.find<ExamDetailController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(R.ASSETS_SVG_IC_BACK_BLACK_SVG),
          ),
        ),
        backgroundColor: colorWhite,
        title: Text(
          'Chi tiết phần thi',
          style: typoBold16,
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  //Get.toNamed(Route)
                },
                child: SvgPicture.asset(
                  R.ASSETS_SVG_IC_CART_SVG,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 16,
              )
            ],
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderExamDetails(),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Leaderboard(),
            SizedBox(
              height: 16,
            ),
            examNows(context),
          ],
        ),
      ),
    );
  }

  examNows(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                "Các bài thi liên quan",
                style: typoBold20,
              )),
              SizedBox(
                width: 16,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Xem  thêm",
                  style: typoRegular14.copyWith(
                      color: colorSemanticBlue100,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            // width: MediaQuery.of(context).size.width,
            height: 400,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, i) {
                  return Container(
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
                                  source:
                                      '${baseUrlImage}c5oojc9e0mdd1brga5og.jpg',
                                  fit: BoxFit.fitWidth,
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
                                        fontWeight: (FontWeight.bold)),
                                  )),
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
                              child: Text("02/02/1999")),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "Kiểm tra cuối kỳ 2 Vật lý lớp 7",
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
                                SvgPicture.asset(
                                    R.ASSETS_SVG_IC_CLOCK_BLUE_SVG),
                                SizedBox(
                                  width: 4,
                                ),
                                Text("30 câu hỏi"),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 13),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                "800.000 đ",
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        side: BorderSide(
                                            color: Colors.blue, width: 3)),
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
                  );
                }),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: boxShadow,
            ),
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: ElevatedButtonBase(
                  // state: controller.selectedGrades.value.length > 0 ||
                  //         controller.selectedAuthors.value.length >
                  //             0 ||
                  //         controller.selectedSubjects.value.length >
                  //             0 ||
                  //         controller.selectedCategorys.value.length >
                  //             0
                  // AppElevatedButtonState.active,

                  height: 40,
                  size: 14,
                  mainColor: colorSecondaryRed100,
                  weight: FontWeight.w700,
                  buttonTitle: "Thi thử",
                  onPressed: () async {
                    //await controller.tapSubmit();
                  },
                )),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: styleButtonRedBorder,
                    child: Text(
                      "Thêm vào giỏ",
                      style: TextStyle(color: colorSecondaryRed100),
                    ),
                    onPressed: () {
                      //Get.back();
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      );
}

class Leaderboard extends StatelessWidget {
  final controiller = Get.find<ExamDetailController>();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    // SizedBox(height: 50,),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffFDF5D8),
                            Color(0xffFFFFFF),
                          ],
                          stops: [0.0, 1.0],
                          //   begin: FractionalOffset.topCenter,
                          //  end: FractionalOffset.bottomCenter,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      Positioned(
        top: 10,
        right: 0.0,
        left: 0.0,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 84.3,
              // padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 55),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/png/Group.png'),
              )),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Bảng Xếp Hạng",
                  style: typoBold24custom,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                margin: EdgeInsets.only(right: 56, left: 43),
                height: 200,
                child: Wrap(
                    children: controiller.nameClasses
                        .map(
                          (e) => GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.only(top: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 32,
                                    height: 34,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage(
                                        'assets/png/yellow_cup.png',
                                      ),
                                    )),
                                    //child: ,
                                  ),
                                  SizedBox(
                                    width: 34,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nguyễn Văn Anh",
                                        style: typoBold16,
                                      ),
                                      Text(
                                        "12:00:30s",
                                        style: typoRegular14,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 34,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '10',
                                            style: typoRegular16Green),
                                        TextSpan(
                                            text: '/10', style: typoRegular16),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList())),
            Container(
              child: SvgPicture.asset(R.ASSETS_SVG_ICON_CHANGE_SVG),
            ),
          ],
        ),
      ),
    ]);
  }
}

class HeaderExamDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 240,
              width: double.infinity,
              child: AppNetworkImage(
                source: "{baseUrlImage}c62g0dv6oea6cgu216pg.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Text(
              "Kiểm tra Hóa học lớp học 8 cuối học kỳ II",
              style: typoBold24,
            ),
            SizedBox(
              height: 12,
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
            Row(
              children: [
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
                      Text("30 câu hỏi"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                            //controller.course.value.ratingAvg ??
                            "4.5",
                            style: typoBold16),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "("
                          //"${controller.course.value.totalRating ?? 0} "
                          " 100 lượt Đánh giá)",
                          style: typoRegular14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  Icon(Icons.person, color: Colors.black),
                  SizedBox(
                    width: 4,
                  ),
                  Text("(250 Học viên)", style: typoBold14),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                      width: 40,
                      height: 40,
                      child:
                          //controller.course.value.teacher?.attributes?.avatar != ''
                          AppNetworkImage(
                        source: "{baseUrlImage}c62g0dv6oea6cgu216pg.jpg",
                        fit: BoxFit.cover,
                      )
                      //      SvgPicture.asset(
                      //   R.ASSETS_SVG_AVATAR_DEFAULT_SVG,
                      // ),
                      ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  // controller.course.value.teacher!.firstName ??
                  "ThS. Nguyễn Văn Anh",
                  style: typoRegular14,
                )
              ],
            ),
            Container(
              child: Column(
                children: [
                  Visibility(
                      child: Row(
                    children: [
                      Text(
                        "10000 đ",
                        style: typoBold24.copyWith(color: colorSecondaryRed100),
                      ),
                    ],
                  )),
                  Visibility(
                      child: Row(
                    children: [
                      Text("10000 đ",
                          style: typoBold16.copyWith(
                              color: colorNeutralGray40,
                              decoration: TextDecoration.lineThrough)),
                    ],
                  )),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Chọn gói mua",
                        style: typoBold16,
                        textAlign: TextAlign.left,
                      )),
                  Container(
                    //color: Colors.amber,
                    height: 200,
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          //  height: 40,
                          // width: 342,
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFFCF4F5),
                            border: Border.all(
                                width: 1,
                                color:
                                    //controller.purchase.value == e
                                    Color(0xFFEC8B8B)
                                // : colorBorderViewSearch
                                ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(6),
                                child: Text(
                                  "Gói 15 tháng",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text("200.000 d")
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(
                    height: 16,
                  ),
                  Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButtonBase(
                            mainColor: colorSemanticRed100,
                            buttonTitle: 'Mua ngay',
                            onPressed: () {
                              //Get.back();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  side:
                                      BorderSide(color: Colors.red, width: 1)),
                              //titleColor: ,
                              // mainColor: colorSemanticRed100,
                              // height: 32,
                              // size: 14,
                              // buttonTitle: "Mua lượt thi",
                              onPressed: () {},
                              child: Text(
                                "Thêm vào giỏ",
                                style: TextStyle(color: Colors.red),
                              ),
                              //child: null,
                            ),
                          ),
                        ),
                        // Expanded(
                        //   child:  ElevatedButtonBase(
                        //     state: AppElevatedButtonState.active,
                        //     height: 40,
                        //     size: 14,
                        //     weight: FontWeight.w700,
                        //     buttonTitle: "Áp dụng",
                        //     // onPressed: () async {
                        //   )
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    //margin: EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButtonBase(
                      mainColor: colorPrimaryBlue100,
                      buttonTitle: "Thi thử",
                      height: 40,
                      onPressed: () {
                        //
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Divider(
              color: colorNeutralGray5,
              thickness: 2.0,
            ),
            Text(
              "Lợi ích bài thi",
              style: typoBold24,
            ),
            Container(
              //color: Colors.red,
              margin: const EdgeInsets.all(16),
              child: Column(
                children: [
                  newMethod(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis, mauris non"),
                  SizedBox(
                    height: 16,
                  ),
                  newMethod(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis, mauris non"),
                  SizedBox(
                    height: 16,
                  ),
                  newMethod(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis, mauris non"),
                  SizedBox(
                    height: 16,
                  ),
                  newMethod(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis, mauris non"),
                  SizedBox(
                    height: 16,
                  ),
                  newMethod(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis, mauris non"),
                  SizedBox(
                    height: 16,
                  ),
                  newMethod(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis, mauris non"),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            Text("Yêu cầu", style: typoBold24),
            Container(
              margin: EdgeInsets.all(16),
              child: Text(
                "Điện thoại, Máy tính bảng, Máy tính, Tivi có kết nối Internet",
                style: typoRegular14custom,
              ),
            ),
            Text("Mô tả bài thi", style: typoBold24),
            Container(
              margin: EdgeInsets.all(16),
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis, mauris non finibus venenatis Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis, mauris non finibus venenatisLorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis, mauris non finibus venenatis Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis, mauris non finibus venenatisLorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis, mauris non finibus venenatisLorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis, mauris non finibus venenatisLorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis, mauris non finibus venenatis",
                  style: typoRegular14custom),
            ),
            // Container(
            //   height: 500,
            //   width: 300,
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [
            //         Color(0xffFDF5D8),
            //         Color(0xffFFFFFF),
            //       ],
            //  stops: [0.0,1.0],
            // // begin: FractionalOffset.topCenter,
            // // end: FractionalOffset.bottomCenter,
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  newMethod(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(R.ASSETS_SVG_DOT_TEXT_SVG),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            text,
            maxLines: 2,
            style: typoRegular14custom,
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
