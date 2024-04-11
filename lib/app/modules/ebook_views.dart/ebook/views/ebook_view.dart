import 'package:elearning/app/data/models/book_models/authors_model.dart';
import 'package:elearning/app/data/models/book_models/book_category_ishomedisplayed.dart';
import 'package:elearning/app/data/models/book_models/book_model.dart';
import 'package:elearning/app/data/models/book_models/list_books_model.dart';
import 'package:elearning/app/data/models/purchase_packages.dart';
import 'package:elearning/app/modules/ebook_views.dart/ebook/controllers/ebook_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/modules/cource_views/home_course/controllers/home_course_controller.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

class EbookView extends GetView<EbookController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCF4F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: colorBlack,
        ),
        title: Text(
          "Sách Điện Tử",
          style: typoBold24,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBook(),
              SizedBox(
                height: 16,
              ),
              BannerBook(),
              SizedBox(
                height: 32,
              ),
              Text("Sách theo cấp học", style: typoBold20),
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
                          color: colorPrimaryBlue20,
                        ),
                        child: Center(
                          child: Text(
                            'Tiểu học',
                            textAlign: TextAlign.center,
                          ),
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
                          color: colorPrimaryBlue20,
                        ),
                        child: Center(
                          child: Text(
                            'THCS',
                            textAlign: TextAlign.center,
                          ),
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
                          color: colorPrimaryBlue20,
                        ),
                        child: Center(
                          child: Text(
                            'THPT',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SubjectBook(),
              ListBooks()
            ],
          ),
        ),
      ),
    );
  }
}

class BannerBook extends StatelessWidget {
  final controller = Get.find<EbookController>();

  BannerBook({Key? key}) : super(key: key);

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
                        viewportFraction: 1,
                        aspectRatio: 2.0,
                        initialPage: 0,
                        onPageChanged: (index, reason) {
                          controller.setSliderIndex(index);
                        }),
                    items: controller.appbanners.map(
                      (obj) {
                        return Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                              onTap: () {
                                launch(obj.linkDirect ?? "");
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width -
                                    15.98 * 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.98),
                                  child: AppNetworkImage(
                                    source: obj.source ??
                                        '${baseUrlImage}c5oojc9e0mdd1brga5og.jpg',
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
                          if (controller.appbanners.value.indexOf(element) ==
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
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class MidBannerBook extends StatelessWidget {
  final controller = Get.find<EbookController>();

  MidBannerBook({Key? key}) : super(key: key);

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
                        viewportFraction: 1,
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
                              onTap: () {
                                launch(obj.linkDirect ?? "");
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width -
                                    15.98 * 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.98),
                                  child: AppNetworkImage(
                                    source: obj.source ??
                                        '${baseUrlImage}c5oojc9e0mdd1brga5og.jpg',
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
                          if (controller.listSlides.value.indexOf(element) ==
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
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class SubjectBook extends StatelessWidget {
  final controller = Get.find<EbookController>();

  SubjectBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Môn Học", style: typoBold20),
          SizedBox(
            height: 16,
          ),
          controller.listSubjectBook.length > 0
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: 136,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.listSubjectBook.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.RESULT_SEARCH_EBOOK, arguments: {
                            "item":
                                controller.listSubjectBook[index].cate!.name,
                            "subject":
                                controller.listSubjectBook[index].cate!.id,
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 0),
                          child: Column(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                padding: EdgeInsets.all(16),
                                margin: EdgeInsets.only(right: 16),
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
                                child: Center(
                                  child: Text(
                                    controller.listSubjectBook[index].cate!
                                            .name ??
                                        "",
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.visible,
                                    style: typoLight14,
                                  ),
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

class ListBooks extends StatelessWidget {
  final controller = Get.find<EbookController>();
  ListBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        bookCategoryHome(context),
        MidBannerBook(),
        bookTopTrend(context),
        bookDiscount(context),
        news(context)
        // bookDiscount(context),
      ],
    );
  }

  bookCategoryHome(BuildContext context) => Obx(
        () => ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount:
              controller.book.value.bookCategoryIsHomeDisplayed?.length ?? 0,
          itemBuilder: (context, index) => item(context,
              controller.book.value.bookCategoryIsHomeDisplayed![index]),
        ),
      );

  item(BuildContext context, BookCategoryIsHomeDisplayed? bookCategory) =>
      bookCategory?.cate!.name != "" && bookCategory?.cate!.name != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child:
                            Text(bookCategory!.cate!.name!, style: typoBold20)),
                    SizedBox(
                      width: 16,
                    ),
                    TextButton(
                      onPressed: () async {
                        await controller
                            .tapSemoreBookCategoryIsHomeDisplayed(bookCategory);
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
                SizedBox(
                  height: 16,
                ),
                bookCategory != null &&
                        bookCategory.books != null &&
                        bookCategory.books!.length > 0
                    ? itemChild(context, bookCategory)
                    : Container(),
                SizedBox(
                  height: 16,
                ),
              ],
            )
          : Center(child: CircularProgressIndicator());

  itemChild(BuildContext context, BookCategoryIsHomeDisplayed? e) => Container(
      height: 440,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: e!.books!.take(8).toList().length,
          itemBuilder: (context, index) {
            final purchase = e.books!.take(8).toList()[index].purchasePackages;
            PurchasePackageHome? purchasePackages;
            if (purchase != null && purchase.length > 0) {
              purchasePackages = purchase.first;
            }
            final author = e.books!.take(8).toList()[index].authors;
            Author? au;
            if (author != null && author.length > 0) {
              au = author.first;
            }
            return GestureDetector(
              onTap: () => Get.toNamed(Routes.EBOOK_DETAILS,
                  arguments: {"id": e.books!.take(8).toList()[index].id}),
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
                            source:
                                e.books!.take(8).toList()[index].cover ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        e.books!.take(8).toList()[index].title ?? "",
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
                          style:
                              typoRegular12.copyWith(color: colorNeutralGray40),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                    controller.bookSaleModel[index].specifyCategories!.length ==
                            0
                        ? SizedBox(
                            height: 34,
                          )
                        : Wrap(
                            children: e.books!
                                .take(8)
                                .toList()[index]
                                .specifyCategories!
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
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50)),
                                                color: colorSemanticBlue20,
                                              ),
                                              child: Text(
                                                e2.name!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: typoRegular14,
                                              )),
                                        ),
                                        e.books!
                                                        .take(8)
                                                        .toList()[index]
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
                                                    margin: EdgeInsets.only(
                                                        right: 8),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 4,
                                                            horizontal: 4),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  24)),
                                                      color:
                                                          colorSemanticBlue20,
                                                    ),
                                                    child: Text(
                                                      "+${e.books!.take(8).toList()[index].specifyCategories!.length - 1}",
                                                      style: typoRegular12,
                                                    )),
                                              )
                                      ],
                                    ))
                                .toList(),
                          ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Text(
                            "${e.books!.take(8).toList()[index].ratingAvg ?? 0}",
                            style: typoBold12,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            child: Icon(Icons.star,
                                color: Colors.yellow, size: 14),
                          ),
                          Expanded(
                            child: Text(
                              "( ${e.books!.take(8).toList()[index].totalCountRating ?? 0} xếp hạng)",
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
                      // height: 25,
                      child: Visibility(
                        visible:
                            e.books!.take(8).toList()[index].isFree == false,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 4, left: 8, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("${purchasePackages?.retailPrice ?? 0} đ",
                                  style: typoBold12.copyWith(
                                      decoration: TextDecoration.lineThrough))
                            ],
                          ),
                        ),
                      ),
                    ),
                    e.books!.take(8).toList()[index].isFree == true
                        ? SizedBox(
                            height: 18,
                          )
                        : Container(),
                    Container(
                      height: 25,
                      // padding:EdgeInsets.only(top:8),
                      child: e.books!.take(8).toList()[index].isFree == true
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 8),
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
                                  top: 4, left: 8, right: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                      "${formatter.format(purchasePackages?.discountPrice ?? 0)} đ",
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
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: ElevatedButtonBase(
                        mainColor:
                            e.books!.take(8).toList()[index].isFree == true
                                ? colorSemanticGreen100
                                : colorPrimaryBlue100,
                        height: 32,
                        size: 14,
                        buttonTitle:
                            e.books!.take(8).toList()[index].isFree == true
                                ? "Đọc miễn phí"
                                : e.books!
                                            .take(8)
                                            .toList()[index]
                                            .isAlreadyPurchased ==
                                        1
                                    ? "Đọc tiếp"
                                    : e.books!
                                                .take(8)
                                                .toList()[index]
                                                .isAllowTrial ==
                                            true
                                        ? "Đọc thử"
                                        : "Xem chi tiết",
                        onPressed: () async {
                          if (e.books!.take(8).toList()[index].isFree == true) {
                            Get.toNamed(Routes.READ_BOOK, arguments: {
                              "id": e.books!.take(8).toList()[index].id,
                              "isFree": e.books!.take(8).toList()[index].isFree,
                            });
                          } else if (e.books!
                                  .take(8)
                                  .toList()[index]
                                  .isAlreadyPurchased ==
                              1) {
                            Get.toNamed(Routes.READ_BOOK, arguments: {
                              "id": e.books!.take(8).toList()[index].id,
                              "isAlreadyPurchased": e.books!
                                  .take(8)
                                  .toList()[index]
                                  .isAlreadyPurchased,
                            });
                          } else if (e.books!
                                  .take(8)
                                  .toList()[index]
                                  .isAllowTrial ==
                              true) {
                            Get.toNamed(Routes.READ_BOOK, arguments: {
                              "id": e.books!.take(8).toList()[index].id,
                              "isAllowtrail":
                                  e.books!.take(8).toList()[index].isAllowTrial,
                              "isAlreadyPurchased": e.books!
                                  .take(8)
                                  .toList()[index]
                                  .isAlreadyPurchased,
                            });
                          } else {
                            Get.toNamed(Routes.EBOOK_DETAILS, arguments: {
                              "id": e.books!.take(8).toList()[index].id,
                              "isAllowtrail":
                                  e.books!.take(8).toList()[index].isAllowTrial,
                              "isAlreadyPurchased": e.books!
                                  .take(8)
                                  .toList()[index]
                                  .isAlreadyPurchased,
                              "isFree": e.books!.take(8).toList()[index].isFree,
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }));

  bookTopTrend(BuildContext context) => Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Nổi bật", style: typoBold20),
                    InkWell(
                      onTap: () => showCupertinoModalBottomSheet(
                        expand: false,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => bottomSheet(controller),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: colorSemanticOrange20,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            )),
                        child: Row(children: [
                          Container(
                            width: 100,
                            child: Text(
                              controller.title.value,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: typoRegular14,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          SvgPicture.asset(R.ASSETS_SVG_IC_ARROW_DOWN_SVG)
                        ]),
                      ),
                    )
                  ],
                ),
                TextButton(
                  onPressed: () async {
                    await controller.tapSemore("Top yêu thích");
                  },
                  child: Row(
                    children: [
                      Text(
                        "Xem thêm",
                        style: typoRegular14.copyWith(
                            color: colorSemanticBlue100,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            controller.listSubjectBookHome.length > 0
                ? Container(
                    height: 450,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.listSubjectBookHome.value.length,
                      itemBuilder: (context, index) {
                        final purchase = controller
                            .listSubjectBookHome.value[index].purchasePackages;
                        PurchasePackageHome? purchasePackages;
                        if (purchase != null && purchase.length > 0) {
                          purchasePackages = purchase.first;
                        }
                        final author =
                            controller.listSubjectBookHome[index].authors;
                        Author? au;
                        if (author != null && author.length > 0) {
                          au = author.first;
                        }
                        return GestureDetector(
                          onTap: () =>
                              Get.toNamed(Routes.EBOOK_DETAILS, arguments: {
                            "id":
                                controller.listSubjectBookHome.value[index].id,
                          }),
                          child: Container(
                            width: (MediaQuery.of(context).size.width - 64) / 2,
                            margin: EdgeInsets.only(right: 8),
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
                                    controller.listSubjectBookHome.value[index]
                                            .title ??
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
                                        children:
                                            controller.listSubjectBookHome
                                                .value[index].specifyCategories!
                                                .take(1)
                                                .map((e2) => Row(
                                                      children: [
                                                        Expanded(
                                                          flex: 4,
                                                          child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          4,
                                                                      horizontal:
                                                                          8),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          4,
                                                                      horizontal:
                                                                          8),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            50)),
                                                                color:
                                                                    colorSemanticBlue20,
                                                              ),
                                                              child: Text(
                                                                e2.name!,
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    typoRegular14,
                                                              )),
                                                        ),
                                                        controller
                                                                        .listSubjectBookHome
                                                                        .value[
                                                                            index]
                                                                        .specifyCategories!
                                                                        .length -
                                                                    1 ==
                                                                0
                                                            ? Container()
                                                            : Expanded(
                                                                flex: 1,
                                                                child:
                                                                    Container(
                                                                        width:
                                                                            24,
                                                                        height:
                                                                            24,
                                                                        margin: EdgeInsets.only(
                                                                            right:
                                                                                8),
                                                                        padding: EdgeInsets.symmetric(
                                                                            vertical:
                                                                                4,
                                                                            horizontal:
                                                                                4),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(24)),
                                                                          color:
                                                                              colorSemanticBlue20,
                                                                        ),
                                                                        child:
                                                                            Text(
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
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${controller.listSubjectBookHome.value[index].ratingAvg ?? 0}",
                                        style: typoBold12,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        child: Icon(Icons.star,
                                            color: Colors.yellow),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                              "${purchasePackages?.retailPrice ?? 0} đ",
                                              style: typoLight12.copyWith(
                                                  decoration: TextDecoration
                                                      .lineThrough))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 25,
                                  child: controller.listSubjectBookHome
                                              .value[index].isFree ==
                                          true
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8, left: 8, right: 8),
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
                                              bottom: 8, left: 8, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                  "${formatter.format(purchasePackages?.discountPrice ?? 0)} đ",
                                                  style: typoLight14.copyWith(
                                                      color:
                                                          colorSemanticRed100))
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
                                        : controller
                                                    .listSubjectBookHome
                                                    .value[index]
                                                    .isAlreadyPurchased ==
                                                1
                                            ? "Đọc tiếp"
                                            : controller
                                                        .listSubjectBookHome
                                                        .value[index]
                                                        .isAllowTrial ==
                                                    true
                                                ? "Đọc thử"
                                                : "Xem chi tiết",
                                    onPressed: () async {
                                      if (controller.listSubjectBookHome
                                              .value[index].isFree ==
                                          true) {
                                        Get.toNamed(Routes.READ_BOOK,
                                            arguments: {
                                              "id": controller
                                                  .listSubjectBookHome
                                                  .value[index]
                                                  .id,
                                              "isFree": controller
                                                  .listSubjectBookHome
                                                  .value[index]
                                                  .isFree,
                                            });
                                      } else if (controller
                                              .listSubjectBookHome
                                              .value[index]
                                              .isAlreadyPurchased ==
                                          1) {
                                        Get.toNamed(Routes.READ_BOOK,
                                            arguments: {
                                              "id": controller
                                                  .listSubjectBookHome
                                                  .value[index]
                                                  .id,
                                              "isAlreadyPurchased": controller
                                                  .listSubjectBookHome
                                                  .value[index]
                                                  .isAlreadyPurchased,
                                            });
                                      } else if (controller.listSubjectBookHome
                                              .value[index].isAllowTrial ==
                                          true) {
                                        Get.toNamed(Routes.READ_BOOK,
                                            arguments: {
                                              "id": controller
                                                  .listSubjectBookHome
                                                  .value[index]
                                                  .id,
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
                                        Get.toNamed(Routes.EBOOK_DETAILS,
                                            arguments: {
                                              "id": controller
                                                  .listSubjectBookHome
                                                  .value[index]
                                                  .id,
                                              "isAllowtrail": controller
                                                  .listSubjectBookHome
                                                  .value[index]
                                                  .isAllowTrial,
                                              "isAlreadyPurchased": controller
                                                  .listSubjectBookHome
                                                  .value[index]
                                                  .isAlreadyPurchased,
                                              "isFree": controller
                                                  .listSubjectBookHome
                                                  .value[index]
                                                  .isFree,
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
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
          ],
        ),
      );

  Widget bottomSheet(EbookController controller) {
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Container(),
          middle: Container(
            height: 5,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: Colors.grey,
            ),
          ),
        ),
        child: SafeArea(
          bottom: true,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        "Nổi bật theo danh mục",
                        style: typoBold18.copyWith(color: colorNeutralGray60),
                      ),
                    ],
                  ),
                ),
                Wrap(
                  children: controller.book.value.bookSubjects!
                      .map((e) => InkWell(
                            onTap: () {
                              controller.selectCate(e.cate!.name!);
                              Get.back();
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 18,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  color: controller.title.value == e.cate!.name
                                      ? colorPrimaryBlue10
                                      : Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        e.cate!.name!,
                                        style: controller.title.value ==
                                                e.cate!.name
                                            ? typoBold14
                                            : typoRegular14.copyWith(
                                                color: colorNeutralGray60),
                                      ),
                                      controller.title.value == e.cate!.name
                                          ? Icon(
                                              Icons.check,
                                              color: colorSemanticGreen100,
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bookDiscount(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sách khuyến mại", style: typoBold20),
              SizedBox(
                width: 16,
              ),
              TextButton(
                onPressed: () async {
                  await controller.tapSemore("Sách khuyến mại");
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
          SizedBox(
            height: 16,
          ),
          controller.bookSaleModel.length > 0
              ? Container(
                  height: 450,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.bookSaleModel.length,
                    itemBuilder: (context, index) {
                      final purchase =
                          controller.bookSaleModel[index].purchasePackages;
                      PurchasePackageHome? purchasePackages;
                      if (purchase != null && purchase.length > 0) {
                        purchasePackages = purchase.first;
                      }
                      final author = controller.bookSaleModel[index].authors;
                      Author? au;
                      if (author != null && author.length > 0) {
                        au = author.first;
                      }
                      return GestureDetector(
                        onTap: () => Get.toNamed(Routes.EBOOK_DETAILS,
                            arguments: {
                              "id": controller.bookSaleModel.value[index].id
                            }),
                        child: Container(
                          width: (MediaQuery.of(context).size.width - 64) / 2,
                          margin: EdgeInsets.only(right: 8),
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
                                    height: 200,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                    ),
                                    child: AppNetworkImage(
                                      source: controller
                                              .bookSaleModel[index].cover ??
                                          "",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  controller.bookSaleModel[index].title ?? "",
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
                              controller.bookSaleModel[index].specifyCategories!
                                          .length ==
                                      0
                                  ? SizedBox(
                                      height: 35,
                                    )
                                  : Wrap(
                                      children:
                                          controller.bookSaleModel[index]
                                              .specifyCategories!
                                              .take(1)
                                              .map((e2) => Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 4,
                                                        child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 4,
                                                                    horizontal:
                                                                        8),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 4,
                                                                    horizontal:
                                                                        8),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          50)),
                                                              color:
                                                                  colorSemanticBlue20,
                                                            ),
                                                            child: Text(
                                                              e2.name!,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style:
                                                                  typoRegular14,
                                                            )),
                                                      ),
                                                      controller
                                                                      .bookSaleModel[
                                                                          index]
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
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              8),
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          vertical:
                                                                              4,
                                                                          horizontal:
                                                                              4),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(24)),
                                                                    color:
                                                                        colorSemanticBlue20,
                                                                  ),
                                                                  child: Text(
                                                                    "+${controller.bookSaleModel[index].specifyCategories!.length - 1}",
                                                                    style:
                                                                        typoRegular12,
                                                                  )),
                                                            )
                                                    ],
                                                  ))
                                              .toList(),
                                    ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    Text(
                                      "${controller.bookSaleModel[index].ratingAvg ?? 0}",
                                      style: typoBold12,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      child: Icon(Icons.star,
                                          color: Colors.yellow),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "( ${controller.bookSaleModel[index].totalCountRating ?? 0} xếp hạng)",
                                        style: typoRegular10.copyWith(
                                            color: colorNeutralGray40),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 25,
                                child: Visibility(
                                  visible: controller
                                          .bookSaleModel.value[index].isFree ==
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
                                child: controller.bookSaleModel.value[index]
                                            .isFree ==
                                        true
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8, left: 8, right: 8),
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
                                            bottom: 8, left: 8, right: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
                                  mainColor: controller.bookSaleModel
                                              .value[index].isFree ==
                                          true
                                      ? colorSemanticGreen100
                                      : colorPrimaryBlue100,
                                  height: 32,
                                  size: 14,
                                  buttonTitle: controller.bookSaleModel
                                              .value[index].isFree ==
                                          true
                                      ? "Đọc miễn phí"
                                      : controller.bookSaleModel.value[index]
                                                  .isAlreadyPurchased ==
                                              1
                                          ? "Đọc tiếp"
                                          : controller
                                                      .bookSaleModel
                                                      .value[index]
                                                      .isAllowTrial ==
                                                  true
                                              ? "Đọc thử"
                                              : "Xem chi tiết",
                                  onPressed: () async {
                                    if (controller.bookSaleModel.value[index]
                                            .isFree ==
                                        true) {
                                      Get.toNamed(Routes.READ_BOOK, arguments: {
                                        "id": controller
                                            .bookSaleModel.value[index].id,
                                        "isFree": controller
                                            .bookSaleModel.value[index].isFree,
                                      });
                                    } else if (controller.bookSaleModel
                                            .value[index].isAlreadyPurchased ==
                                        1) {
                                      Get.toNamed(Routes.READ_BOOK, arguments: {
                                        "id": controller
                                            .bookSaleModel.value[index].id,
                                        "isAlreadyPurchased": controller
                                            .bookSaleModel
                                            .value[index]
                                            .isAlreadyPurchased,
                                      });
                                    } else if (controller.bookSaleModel
                                            .value[index].isAllowTrial ==
                                        true) {
                                      Get.toNamed(Routes.READ_BOOK, arguments: {
                                        "id": controller
                                            .bookSaleModel.value[index].id,
                                        "isAllowtrail": controller.bookSaleModel
                                            .value[index].isAllowTrial,
                                        "isAlreadyPurchased": controller
                                            .bookSaleModel
                                            .value[index]
                                            .isAlreadyPurchased,
                                      });
                                    } else {
                                      Get.toNamed(Routes.EBOOK_DETAILS,
                                          arguments: {
                                            "id": controller
                                                .bookSaleModel.value[index].id,
                                            "isAllowtrail": controller
                                                .bookSaleModel
                                                .value[index]
                                                .isAllowTrial,
                                            "isAlreadyPurchased": controller
                                                .bookSaleModel
                                                .value[index]
                                                .isAlreadyPurchased,
                                            "isFree": controller.bookSaleModel
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
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  news(BuildContext context) => Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tin tức", style: typoBold20),
              SizedBox(
                width: 16,
              ),
              TextButton(
                onPressed: () async {
                  await controller.tapSemore("Tin tức");
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
                          controller.detailNews(controller.news[e].id);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width - 120,
                          margin: EdgeInsets.only(right: 9),
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
                                        text: fullStringTimeFormat(time),
                                        style: typoRegular14.copyWith(
                                            color: colorNeutralGray90),
                                      ),
                                    ])),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8, left: 8, right: 8),
                                child: Text(
                                  controller.news[e].title ?? "",
                                  style: typoBold14.copyWith(
                                      color: colorNeutralGray90),
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
              : Center(child: CircularProgressIndicator()),
        ],
      ));
}

class SearchBook extends StatelessWidget {
  final controller = Get.find<EbookController>();
  SearchBook({
    Key? key,
  }) : super(key: key);

  // final void Function(Map<String, String>) onSelectSearchView;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    Text("Tìm tên sách, tác giả..",
                        style:
                            typoRegular14.copyWith(color: colorNeutralGray60)),
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
                  'Chọn Lớp học',
                  style: typoBold18,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  title,
                  style: typoBold14,
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
                                  Get.toNamed(Routes.RESULT_SEARCH_EBOOK,
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
