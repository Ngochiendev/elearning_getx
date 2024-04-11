import 'package:elearning/app/components/app_elevated_button.dart';
import 'package:elearning/app/components/app_expansion_tile.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/data/models/book_models/authors_model.dart';
import 'package:elearning/app/modules/cart_views/cart_product/controllers/cart_product_controller.dart';
import 'package:elearning/app/modules/ebook_views.dart/ebook_details/components/document_book_view.dart';
import 'package:elearning/app/modules/ebook_views.dart/ebook_details/components/information_book_view.dart';
import 'package:elearning/app/modules/ebook_views.dart/ebook_details/components/question_book_view.dart';
import 'package:elearning/app/modules/ebook_views.dart/ebook_details/components/rate_book_view.dart';
import 'package:elearning/app/modules/ebook_views.dart/ebook_details/components/tabbar_book_page.dart';
import 'package:elearning/app/modules/main_screen/book_progress/controllers/book_progress_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/ebook_details_controller.dart';

class EbookDetailsView extends GetView<EbookDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(R.ASSETS_SVG_IC_BACK_BLACK_SVG),
            ),
          ),
          title: Text(
            "Chi tiết  sách",
            style: typoBold16,
          ),
          backgroundColor: colorWhite,
          centerTitle: true,
          actions: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.CART_PRODUCT);
                  },
                  child: SvgPicture.asset(R.ASSETS_SVG_IC_CART_SVG,
                      color: colorBlack),
                ),
                SizedBox(
                  width: 16,
                )
              ],
            )
          ],
        ),
        body: controller.bookDetailModel.value.id != null
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeaderEbookDetails(),
                          authorLayout(context),
                          SizedBox(
                            height: 20,
                          ),
                          controller.itemSelected.value == 0
                              ? TabbareBookPageView()
                              : controller.itemSelected.value == 1
                                  ? DocumentBookPage()
                                  : controller.itemSelected.value == 2
                                      ? QuestionBookPage()
                                      : InformationBookPage(),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            height: 1,
                            color: colorNeutralGray5,
                          ),
                          RateBookView(),
                          Divider(
                            height: 1,
                            color: colorNeutralGray5,
                          ),
                          FooterEbookDetails()
                        ],
                      )),
                ),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }

  authorLayout(BuildContext context) => Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tác giả", style: typoBold18),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 200,
            child: PageView(
                controller: controller.pageController,
                onPageChanged: (value) {
                  print(value);
                  controller.onchangeAuthor(value);
                },
                children: controller.bookDetailModel.value.authorRefs!
                    .map(
                      (e) => Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  child: AppNetworkImage(
                                    source: e.avatar ??
                                        "https://images.squarespace-cdn.com/content/v1/573e57871bbee0d6dea60fff/1551203818326-Y2YY9W2OHZT2R28UZ2UC/what-is-teacher-burnout.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.name ?? "Nguyen Bao Quynh",
                                    style: typoBold16,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    e.profession ?? "Clinical Professor",
                                    style: typoRegular14,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  e.description ?? "",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: typoRegular14,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () => showCupertinoModalBottomSheet(
                                  expand: true,
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) => buildDescrition(
                                      context, controller, 1,
                                      des: e.description!),
                                ),
                                child: Text(
                                  "Xem chi tiết",
                                  style: typoRegular12.copyWith(
                                      color: colorSemanticBlue100,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                    .toList()),
          ),
          controller.bookDetailModel.value.authorRefs!.length == 1
              ? Container()
              : Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0;
                          i <
                              controller
                                  .bookDetailModel.value.authorRefs!.length;
                          i++)
                        i == controller.indicatorAuthor.value
                            ? _buildPageIndicator(true)
                            : _buildPageIndicator(false),
                    ],
                  ),
                ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 1,
            decoration: BoxDecoration(
              color: colorNeutralGray5,
              boxShadow: boxShadow,
            ),
          ),
          Container(
            height: 30,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: controller.listTableCategory.length,
              itemBuilder: (context, index) => Obx(
                () => GestureDetector(
                  onTap: () => controller.onTapItem(index),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "${controller.listTableCategory[index]} ${controller.listTableCategory[index] == "Tài liệu" ? "(${controller.documents.length})" : controller.listTableCategory[index] == "Câu hỏi" ? "(${controller.questionContent.length})" : ""}",
                      style: index == controller.itemSelected.value
                          ? typoBold18
                          : typoRegular16,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ));
}

Widget _buildPageIndicator(bool isCurrentPage) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 2.0),
    height: isCurrentPage ? 10.0 : 6.0,
    width: isCurrentPage ? 10.0 : 6.0,
    decoration: BoxDecoration(
      color: isCurrentPage ? colorSecondaryRed100 : colorNeutralGray40,
      borderRadius: BorderRadius.circular(12),
    ),
  );
}

class HeaderEbookDetails extends StatelessWidget {
  final controller = Get.find<EbookDetailsController>();
  HeaderEbookDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 330,
            child: Stack(
              children: [
                Container(
                  height: 92,
                  width: MediaQuery.of(context).size.width,
                  child: AppNetworkImage(
                    source: controller.bookDetailModel.value.background ??
                        "${baseUrlImage}c62g0dv6oea6cgu216pg.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    top: 16,
                    left: 40,
                    right: 40,
                    height: 350,
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.all(32),
                        child: AppNetworkImage(
                          source: controller.bookDetailModel.value.cover ??
                              "${baseUrlImage}c62g0dv6oea6cgu216pg.jpg",
                          fit: BoxFit.contain,
                        ),
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(controller.bookDetailModel.value.title ?? "", style: typoBold24),
          SizedBox(
            height: 16,
          ),
          Column(
            children: [
              Html(
                data: controller.bookDetailModel.value.briefDescription ?? "",
                style: {
                  '#': Style(
                    color: colorNeutralGray60,
                    fontSize: FontSize(14),
                  ),
                },
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () => showCupertinoModalBottomSheet(
                      expand: true,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) =>
                          buildDescrition(context, controller, 0),
                    ),
                    child: Text(
                      "Xem nội dung sách ",
                      style: typoRegular12.copyWith(
                          color: colorSemanticBlue100,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Wrap(
            children: controller.specifyCategoryRefs
                .map((e2) => Container(
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: colorSemanticBlue20,
                    ),
                    child: Text(
                      e2.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: typoRegular14,
                    )))
                .toList(),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "${controller.bookDetailModel.value.ratingAvg ?? 0}",
                    style: typoBold16,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(Icons.star, color: Colors.yellow),
                  SizedBox(
                    width: 4,
                  ),
                  Text("(${controller.listRating.length} lượt Đánh giá)",
                      style: typoRegular14)
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: 40,
                  height: 40,
                  child: AppNetworkImage(
                    source: controller.author.value.avatar ??
                        "https://images.squarespace-cdn.com/content/v1/573e57871bbee0d6dea60fff/1551203818326-Y2YY9W2OHZT2R28UZ2UC/what-is-teacher-burnout.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                controller.author.value.name ?? "Nguyen Bao Quynh",
                style: typoRegular14,
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Visibility(
              visible: controller.bookDetailModel.value.isFree == true,
              child: Text("Miễn phí",
                  style: typoBold24.copyWith(color: colorSemanticGreen100))),
          Visibility(
              visible: controller.bookDetailModel.value.isFree == false,
              child: Text(
                  "${formatter.format(controller.purchase.value.discountPrice ?? 0)} đ",
                  style: typoBold24.copyWith(color: colorSemanticRed100))),
          SizedBox(
            height: 8,
          ),
          Visibility(
              visible: controller.bookDetailModel.value.isFree == false,
              child: Text(
                "${formatter.format(controller.purchase.value.retailPrice ?? 0)} đ",
                style: typoRegular16.copyWith(
                    color: colorNeutralGray40,
                    decoration: TextDecoration.lineThrough),
              )),
          controller.bookDetailModel.value.isFree == false
              ? Text("Chọn gói mua", style: typoBold16)
              : Ink(),
          controller.bookDetailModel.value.isFree == false
              ? Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: GridView.count(
                    childAspectRatio: MediaQuery.of(context).size.height / 256,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: controller.purchasePackages
                        .map((e) => GestureDetector(
                              onTap: () {
                                controller.setPurchasePackage(e);
                              },
                              child: Container(
                                margin: EdgeInsets.all(8),
                                padding: EdgeInsets.all(8),
                                height: 40,
                                decoration: BoxDecoration(
                                  color: controller.purchase.value == e
                                      ? Color(0xFFFCF4F5)
                                      : colorNeutralGray5,
                                  border: Border.all(
                                      width: 1,
                                      color: controller.purchase.value == e
                                          ? Color(0xFFEC8B8B)
                                          : colorBorderViewSearch),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Gói ${e.duration ?? 0} tháng",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                )
              : Container(),
          controller.bookDetailModel.value.isFree == true
              ? Container()
              : ElevatedButtonBase(
                  mainColor: colorSemanticRed100,
                  // mainColor: colorSemanticRed100,
                  height: 40,
                  size: 14,
                  weight: FontWeight.w700,
                  buttonTitle: "Thêm vào giỏ",
                  onPressed: () async {
                    await controller.addToCart();
                  },
                ),
          // ElevatedButtonBase(
          //   mainColor: controller.bookDetailModel.value.isFree == true
          //       ? colorNeutralGray40
          //       : colorSemanticRed100,
          //   height: 40,
          //   size: 14,
          //   weight: FontWeight.w700,
          //   buttonTitle: "Thêm vào giỏ",
          //   onPressed: () {},
          // ),
          SizedBox(
            height: 16,
          ),
          ElevatedButtonBase(
            mainColor: controller.bookDetailModel.value.isFree == true
                ? colorSemanticGreen100
                : controller.bookDetailModel.value.isAlreadyPurchased == 1 ||
                        controller.bookDetailModel.value.isAllowTrial == true
                    ? colorPrimaryBlue100
                    : colorSemanticRed40,
            height: 32,
            size: 14,
            buttonTitle: controller.bookDetailModel.value.isFree == true
                ? "Đọc miễn phí"
                : controller.bookDetailModel.value.isAlreadyPurchased == 1
                    ? "Đọc tiếp"
                    : controller.bookDetailModel.value.isAllowTrial == true
                        ? "Đọc thử"
                        : "Mua ngay",
            weight: FontWeight.w700,
            onPressed: () async {
              if (controller.bookDetailModel.value.isFree == true) {
                Get.toNamed(Routes.READ_BOOK, arguments: {
                  "id": controller.bookDetailModel.value.id,
                  "isFree": controller.bookDetailModel.value.isFree
                });
              } else if (controller.bookDetailModel.value.isAlreadyPurchased ==
                  1) {
                Get.toNamed(Routes.READ_BOOK, arguments: {
                  "id": controller.bookDetailModel.value.id,
                  "isAlreadyPurchased":
                      controller.bookDetailModel.value.isAlreadyPurchased
                });
              } else if (controller.bookDetailModel.value.isAllowTrial ==
                  true) {
                Get.toNamed(Routes.READ_BOOK, arguments: {
                  "id": controller.bookDetailModel.value.id,
                  "isAllowTrial": controller.bookDetailModel.value.isAllowTrial
                });
              } else {
                await controller.addToCart();
              }
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 1,
            decoration: BoxDecoration(
              color: colorNeutralGray5,
              boxShadow: boxShadow,
            ),
          ),
        ],
      ),
    );
  }
}

buildDescrition(
    BuildContext context, EbookDetailsController controller, int type,
    {String des = ""}) {
  return Material(
      child: CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      leading: Container(),
      middle: Container(
        height: 5,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Color(0xFFE6E6E6),
        ),
      ),
    ),
    child: SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, top: 15, bottom: 16),
            child: Row(
              children: [
                Text(type == 0 ? "Nội dung sách" : "Tác giả ",
                    style: typoBold18),
              ],
            ),
          ),
          Expanded(
            child: Scrollbar(
              isAlwaysShown: true,
              showTrackOnHover: true,
              thickness: 5,
              radius: Radius.circular(30),
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(16),
                child: type == 0
                    ? Text(
                        controller.bookDetailModel.value.description == ""
                            ? ""
                            : controller.bookDetailModel.value.description!
                                .replaceAll("<p>", "")
                                .replaceAll("</p>", ""),
                        style: typoRegular14,
                      )
                    : Text(
                        des,
                        style: typoRegular14,
                      ),
              )),
            ),
          ),
        ],
      ),
    ),
  ));
}

class FooterEbookDetails extends StatelessWidget {
  final controller = Get.find<EbookDetailsController>();

  FooterEbookDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sách cùng loại", style: typoBold20),
              SizedBox(
                width: 16,
              ),
              // TextButton(
              //   onPressed: () async {
              //     await controller.tapSemore("Sách cùng loại");
              //   },
              //   child: Text(
              //     "Xem thêm",
              //     style: typoRegular14.copyWith(
              //         color: colorSemanticBlue100,
              //         decoration: TextDecoration.underline),
              //   ),
              // ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          controller.listBooks.length > 0
              ? Container(
                  height: 380,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.listBooks.length,
                    itemBuilder: (context, index) {
                      //  final purchase =
                      //     controller.listBooks[index].purchasePackages;
                      // PurchasePackagesModel? purchasePackages;
                      // if (purchase != null && purchase.length > 0) {
                      //   purchasePackages = purchase.first;
                      // }
                      final author = controller.listBooks[index].authors;
                      AuthorModel? au;
                      if (author != null && author.length > 0) {
                        au = author.first;
                      }
                      return GestureDetector(
                        onTap: () async {
                          print("click");
                          // controller.nextScreen(controller.listBooks[index].id!.toInt());
                          controller.scrollController.animateTo(
                            controller
                                .scrollController.position.minScrollExtent,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastOutSlowIn,
                          );
                          await controller.getDetailBook(
                              controller.listBooks[index].id!.toString());
                          await controller
                              .getRatingBook(controller.listBooks[index].id!);

                          // Get.toNamed(Routes.EBOOK_DETAILS,
                          //     arguments: controller.listBooks[index].id);
                        },
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
                                    height: 200,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                    ),
                                    child: AppNetworkImage(
                                      source:
                                          controller.listBooks[index].cover ??
                                              "",
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
                                    style: typoRegular12.copyWith(
                                        color: colorNeutralGray40),
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              //     Wrap(
                              //     children: controller.listBooks[index]
                              //         .specifyCategories!
                              //         .take(1)
                              //         .map((e2) => Row(
                              //               children: [
                              //                 Expanded(
                              //                   flex: 4,
                              //                   child: Container(
                              //                       margin:
                              //                           EdgeInsets.symmetric(
                              //                               vertical: 4,
                              //                               horizontal: 8),
                              //                       padding:
                              //                           EdgeInsets.symmetric(
                              //                               vertical: 4,
                              //                               horizontal: 8),
                              //                       decoration: BoxDecoration(
                              //                         borderRadius:
                              //                             BorderRadius.all(
                              //                                 Radius.circular(
                              //                                     50)),
                              //                         color:
                              //                             colorSemanticBlue20,
                              //                       ),
                              //                       child: Text(
                              //                         e2.name!,
                              //                         maxLines: 1,
                              //                         overflow:
                              //                             TextOverflow.ellipsis,
                              //                         style: typoRegular14,
                              //                       )),
                              //                 ),
                              //                 controller.listBooks[index]
                              //                                 .specifyCategories!
                              //                                 .length -
                              //                             1 ==
                              //                         0
                              //                     ? Container()
                              //                     : Expanded(
                              //                         flex: 1,
                              //                         child: Container(
                              //                             width: 24,
                              //                             height: 24,
                              //                             margin:
                              //                                 EdgeInsets.only(
                              //                                     right: 8),
                              //                             padding: EdgeInsets
                              //                                 .symmetric(
                              //                                     vertical: 4,
                              //                                     horizontal:
                              //                                         4),
                              //                             decoration:
                              //                                 BoxDecoration(
                              //                               borderRadius:
                              //                                   BorderRadius
                              //                                       .all(Radius
                              //                                           .circular(
                              //                                               24)),
                              //                               color:
                              //                                   colorSemanticBlue20,
                              //                             ),
                              //                             child: Text(
                              //                               "+${controller.listBooks[index].specifyCategories!.length - 1}",
                              //                               style:
                              //                                   typoRegular12,
                              //                             )),
                              //                       )
                              //               ],
                              //             ))
                              //         .toList(),
                              //   ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "4.3",
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
                                        "( 20.123 xếp hạng)",
                                        style: typoRegular10.copyWith(
                                            color: colorNeutralGray40),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       bottom: 8, left: 8, right: 8),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.end,
                              //     children: [
                              //       Text("Đọc miễn phí",
                              //           style: typoLight12.copyWith(color: colorWhite))
                              //     ],
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       bottom: 8, left: 8, right: 8),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.end,
                              //     children: [
                              //       Text(
                              //           "${formatter.format(purchasePackages?.discountPrice ?? 0)} đ",
                              //           style: typoLight14.copyWith(
                              //               color: colorSemanticRed100))
                              //     ],
                              //   ),
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
                                  height: 32,
                                  mainColor:
                                      controller.listBooks[index].isFree == true
                                          ? colorSemanticGreen100
                                          : colorPrimaryBlue100,
                                  size: 12,
                                  buttonTitle:
                                      controller.listBooks[index].isFree == true
                                          ? "Đọc miễn phí"
                                          : controller.listBooks[index]
                                                      .isAlreadyPurchased ==
                                                  1
                                              ? "Đọc tiếp"
                                              : controller.listBooks[index]
                                                          .isAllowTrial ==
                                                      true
                                                  ? "Đọc thử"
                                                  : "Xem chi tiết",
                                  onPressed: () async {
                                    if (controller.listBooks[index].isFree ==
                                        true) {
                                      Get.toNamed(Routes.READ_BOOK, arguments: {
                                        "id": controller.listBooks[index].id,
                                        "isFree":
                                            controller.listBooks[index].isFree
                                      });
                                    } else if (controller.listBooks[index]
                                            .isAlreadyPurchased ==
                                        1) {
                                      Get.toNamed(Routes.READ_BOOK, arguments: {
                                        "id": controller.listBooks[index].id,
                                        "isAlreadyPurchased": controller
                                            .listBooks[index].isAlreadyPurchased
                                      });
                                    } else if (controller
                                            .listBooks[index].isAllowTrial ==
                                        true) {
                                      Get.toNamed(Routes.READ_BOOK, arguments: {
                                        "id": controller.listBooks[index].id,
                                        "isAllowTrial": controller
                                            .listBooks[index].isAllowTrial
                                      });
                                    } else {
                                      controller.scrollController.animateTo(
                                        controller.scrollController.position
                                            .minScrollExtent,
                                        duration: Duration(seconds: 1),
                                        curve: Curves.fastOutSlowIn,
                                      );
                                      await controller.getDetailBook(controller
                                          .listBooks[index].id!
                                          .toString());
                                      await controller.getRatingBook(
                                          controller.listBooks[index].id!);
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
}
