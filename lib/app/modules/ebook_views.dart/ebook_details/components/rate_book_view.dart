import 'package:elearning/app/components/app_dialog.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/modules/ebook_views.dart/ebook_details/controllers/ebook_details_controller.dart';
import 'package:elearning/app/modules/main_screen/book_progress/controllers/book_progress_controller.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

class RateBookView extends StatelessWidget {
  final controller = Get.find<EbookDetailsController>();
  final controllerBookProgress = Get.find<BookProgressController>();
  RateBookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Đánh giá",
                    style: typoBold18,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        child: RatingBarIndicator(
                          rating: controller.bookDetailModel.value.totalCountRating!.toDouble(),
                          itemBuilder: (context, index) =>SvgPicture.asset(R.ASSETS_SVG_IC_STAR_YELLOW_SVG),
                          itemCount: 5,
                          itemSize: 15.0,
                          unratedColor: Colors.grey,
                          direction:Axis.horizontal,
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${controller.bookDetailModel.value.ratingAvg??0}",
                      style: typoBold24,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Get.toNamed(Routes.DETAIL_RATING),
                  child: Text(
                    "Xem tất cả đánh giá  ",
                    style: typoRegular12.copyWith(
                        color: colorSemanticBlue100,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            controller.listRating.isEmpty
                ? Container()
                : Container(
                    height: 150,
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView(
                              controller: controller.pageController,
                              onPageChanged: (value) {
                                print(value);
                                controller.onchange(value);
                              },
                              children: controller.listRating
                                  .take(3)
                                  .map((e) => Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              child: AppNetworkImage(
                                                source: controller
                                                        .author.value.avatar ??
                                                    "https://images.squarespace-cdn.com/content/v1/573e57871bbee0d6dea60fff/1551203818326-Y2YY9W2OHZT2R28UZ2UC/what-is-teacher-burnout.jpg",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Container(
                                                    child:RatingBarIndicator(
                                                      rating: e.rating!.toDouble(),
                                                      itemBuilder: (context, index) =>SvgPicture.asset(R.ASSETS_SVG_IC_STAR_YELLOW_SVG),
                                                      itemCount: 5,
                                                      itemSize: 12.0,
                                                      unratedColor: Colors.grey,
                                                      direction:Axis.horizontal,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 16,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${fullStringDateTimerFormat(e.createdAt.toString())}",
                                                      style: typoRegular10.copyWith(
                                                          color:
                                                              colorNeutralGray60),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 8),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                     e.user!=null? "${e.user!.firstName ??""} ${e.user!.lastName??""}"
                                                         :"Nguyen Bao Quynh",
                                                      style: typoBold12,
                                                    ),
                                                    SizedBox(width: 10,),
                                                    e.status=="active"? Row(
                                                      children: [
                                                        SvgPicture.asset(R.ASSETS_SVG_BADGE_CHECK_SVG),
                                                        Text(
                                                          "Chứng nhận đã mua sách",
                                                          style: typoRegular10.copyWith(color: colorSemanticGreen100),
                                                        ),
                                                      ],
                                                    ):Container()
                                                  ],
                                                ),
                                              ),
                                              Text(
                                               e.content??"không có bình luận",
                                                style: typoRegular14,
                                                maxLines: 4,
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            ],
                                          ))
                                        ],
                                      ))
                                  .toList()),
                        ),
                       controller.listRating.length==1?Container(): Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0;
                                  i < controller.listRating.take(3).length;
                                  i++)
                                i == controller.indicator.value
                                    ? _buildPageIndicator(true)
                                    : _buildPageIndicator(false),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
            InkWell(
              onTap: (){
                voteBook(context,controllerBookProgress,controller.bookDetailModel.value.id!,myRating: controller.myRating.length==0?[]:controller.myRating);
                if(controller.myRating.isNotEmpty){

                  controllerBookProgress.commentCtrl.value=TextEditingValue(text: controller.myRating[0].content!);
                }else{
                  if(controllerBookProgress.cmts.isNotEmpty){
                    controllerBookProgress.cmts.clear();

                  }
                  controllerBookProgress.commentCtrl.clear();
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Đánh giá của bạn",
                      style: typoBold18,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 16),
                          child: RatingBarIndicator(
                            rating:  controller.myRating.length==0?0.0: controller.myRating[0].rating!.toDouble(),
                            itemBuilder: (context, index) =>SvgPicture.asset(R.ASSETS_SVG_IC_STAR_YELLOW_SVG),
                            itemCount: 5,
                            itemSize: 15.0,
                            unratedColor: Colors.grey,
                            direction:Axis.horizontal,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
}
class RatingDetail extends StatelessWidget {
  final controller = Get.find<EbookDetailsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.close,color: colorBlack,size: 24,),
          ),
        ),
        title: Text(
          controller.bookDetailModel.value.title??"",
          maxLines: 1,
          overflow: TextOverflow.clip,
          style: typoBold16,
        ),
        backgroundColor: colorWhite,
        centerTitle: true,

      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Đánh giá trung bình ",
                    style: typoBold18,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        child: RatingBarIndicator(
                          rating: controller.bookDetailModel.value.totalCountRating!.toDouble(),
                          itemBuilder: (context, index) =>SvgPicture.asset(R.ASSETS_SVG_IC_STAR_YELLOW_SVG),
                          itemCount: 5,
                          itemSize: 15.0,
                          unratedColor: Colors.grey,
                          direction:Axis.horizontal,
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${controller.bookDetailModel.value.ratingAvg??0}",
                      style: typoBold24,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: colorNeutralGray5,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Obx(
                      ()=>TextButton(
                        onPressed: ()=>showCupertinoModalBottomSheet(
                          expand: false,
                          context: context,

                          backgroundColor: Colors.transparent,
                          builder: (context) =>
                              buildSelectImage(context, controller),
                        ),
                        child: controller.rating.value==0? Text(
                          "Tất cả (${controller.listRating.length})",
                          style: typoRegular14,
                        ): Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(vertical: 0),
                                  child: RatingBarIndicator(
                                    rating: controller.rating.value.toDouble(),
                                    itemBuilder: (context, index) =>SvgPicture.asset(R.ASSETS_SVG_IC_STAR_YELLOW_SVG),
                                    itemCount:5,
                                    itemSize: 15.0,
                                    unratedColor: Colors.grey,
                                    direction:Axis.horizontal,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                " (${ controller.listRating.length})",
                                style: typoRegular14,
                              ),
                            ],
                          ),
                        ),
                    ),
                    ),


                SizedBox(
                  width: 16,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: (){
                        controller.sortList(controller.isNewSort.value=!controller.isNewSort.value);
                      },
                      child: Obx(
                        ()=> Row(
                          children: [
                            Text(
                              controller.isNewSort.value? "Mới nhất":"Cũ nhất",
                              style: typoRegular14,
                            ),
                            SizedBox(width: 7,),
                            controller.isNewSort.value?SvgPicture.asset(R.ASSETS_SVG_IC_ROWUPBLACK_SVG):SvgPicture.asset(R.ASSETS_SVG_IC_ROWDOWNRED_SVG)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Expanded(
              
              child: SingleChildScrollView(
                child: Obx(
                  ()=> Wrap(
                    children: controller.listRating.map((e) => Padding(
                      padding: const EdgeInsets.only(top:16),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius:
                                BorderRadius.circular(20.0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: AppNetworkImage(
                                    source: controller
                                        .author.value.avatar ??
                                        "https://images.squarespace-cdn.com/content/v1/573e57871bbee0d6dea60fff/1551203818326-Y2YY9W2OHZT2R28UZ2UC/what-is-teacher-burnout.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            child:RatingBarIndicator(
                                              rating: e.rating!.toDouble(),
                                              itemBuilder: (context, index) =>SvgPicture.asset(R.ASSETS_SVG_IC_STAR_YELLOW_SVG),
                                              itemCount: 5,
                                              itemSize: 12.0,
                                              unratedColor: Colors.grey,
                                              direction:Axis.horizontal,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${fullStringDateTimerFormat(e.createdAt.toString())}",
                                              style: typoRegular10.copyWith(
                                                  color:
                                                  colorNeutralGray60),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: Row(
                                          children: [
                                            Text(
                                              e.user!=null? "${e.user!.firstName ??""} ${e.user!.lastName??""}"
                                                  :"Nguyen Bao Quynh",
                                              style: typoBold12,
                                            ),
                                            SizedBox(width: 10,),
                                            e.status=="active"? Row(
                                              children: [
                                                SvgPicture.asset(R.ASSETS_SVG_BADGE_CHECK_SVG),
                                                Text(
                                                  "Chứng nhận đã mua sách",
                                                  style: typoRegular10.copyWith(color: colorSemanticGreen100),
                                                ),
                                              ],
                                            ):Container()
                                          ],
                                        ),
                                      ),
                                      Text(
                                        e.content??"không có bình luận",
                                        style: typoRegular14,
                                      ),
                                      SizedBox(height: 24,),
                                    ],
                                  ))
                            ],
                          ),

                        ],
                      ),
                    )).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildSelectImage(BuildContext context, EbookDetailsController controller) {
    return Material(
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: Container(),
            middle: Container(
              height: 5,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                color: Colors.grey,
              ),
            ),
          ),
          child: SafeArea(
            bottom: true,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Obx(
                ()=> Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Lọc Đánh giá ",
                          style: typoBold18.copyWith(color: colorNeutralGray60),
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),
                    InkWell(
                      onTap: (){
                        Get.back();
                        controller.selectRate(0);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tất cả",
                            style: typoRegular14,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${ controller.ratingModel.value.data!.ratings!.length} lượt",
                            style: typoRegular14,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16,),
                    InkWell(
                      onTap: (){
                        Get.back();
                        controller.selectRate(5);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              child: RatingBarIndicator(
                                rating: 5,
                                itemBuilder: (context, index) =>SvgPicture.asset(R.ASSETS_SVG_IC_STAR_YELLOW_SVG),
                                itemCount: 5,
                                itemSize: 15.0,
                                unratedColor: Colors.grey,
                                direction:Axis.horizontal,
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                           "${ controller.ratingModel.value.data!.ratings!.where((e) => e.rating==5).length} lượt",
                            style: typoRegular14,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.back();
                        controller.selectRate(4);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              child: RatingBarIndicator(
                                rating: 4,
                                itemBuilder: (context, index) =>SvgPicture.asset(R.ASSETS_SVG_IC_STAR_YELLOW_SVG),
                                itemCount: 5,
                                itemSize: 15.0,
                                unratedColor: Colors.grey,
                                direction:Axis.horizontal,
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${ controller.ratingModel.value.data!.ratings!.where((e) => e.rating==4).length} lượt",
                            style: typoRegular14,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.back();
                        controller.selectRate(3);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              child: RatingBarIndicator(
                                rating: 3,
                                itemBuilder: (context, index) =>SvgPicture.asset(R.ASSETS_SVG_IC_STAR_YELLOW_SVG),
                                itemCount: 5,
                                itemSize: 15.0,
                                unratedColor: Colors.grey,
                                direction:Axis.horizontal,
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${ controller.ratingModel.value.data!.ratings!.where((e) => e.rating==3).length} lượt",
                            style: typoRegular14,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.back();
                        controller.selectRate(2);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              child: RatingBarIndicator(
                                rating: 2,
                                itemBuilder: (context, index) =>SvgPicture.asset(R.ASSETS_SVG_IC_STAR_YELLOW_SVG),
                                itemCount: 5,
                                itemSize: 15.0,
                                unratedColor: Colors.grey,
                                direction:Axis.horizontal,
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${ controller.ratingModel.value.data!.ratings!.where((e) => e.rating==2).length} lượt",
                            style: typoRegular14,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.back();
                        controller.selectRate(1);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              child: RatingBarIndicator(
                                rating: 1,
                                itemBuilder: (context, index) =>SvgPicture.asset(R.ASSETS_SVG_IC_STAR_YELLOW_SVG),
                                itemCount: 5,
                                itemSize: 15.0,
                                unratedColor: Colors.grey,
                                direction:Axis.horizontal,
                              )),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${ controller.ratingModel.value.data!.ratings!.where((e) => e.rating==1).length} lượt",
                            style: typoRegular14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
