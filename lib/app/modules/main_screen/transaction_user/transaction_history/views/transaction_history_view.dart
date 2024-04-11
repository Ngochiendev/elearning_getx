import 'package:elearning/app/data/models/book_models/book_history_model.dart';
import 'package:elearning/app/data/models/order_model.dart';
import 'package:elearning/app/routes/app_pages.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/locales.g.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/transaction_history_controller.dart';

enum Status { pending, complete, error }

class TransactionHistoryView extends GetView<TransactionHistoryController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: colorBackgroundProfile,
        appBar: AppBar(
          // bottom: TabBar(
          //   isScrollable: true,
          //   unselectedLabelColor: colorBlack,
          //   indicatorColor: colorSecondaryRed100,
          //   labelStyle: typoRegular12.copyWith(color: colorBlack),
          //   indicatorSize: TabBarIndicatorSize.label,
          //   tabs: [
          //     Tab(
          //       text: "Anh yêu em",
          //     )
          //   ],
          //
          // ),
           toolbarHeight: 60,
          bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: colorBlack,
            indicatorColor: colorSecondaryRed100,
            labelStyle: typoRegular12.copyWith(color: colorBlack),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
            Tab(
              text: "Khóa học",
            ),
            Tab(
              text: "Sách điện tử",
            ),
            Tab(
              text: "Bài thi",
            ),
          ],
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 4, color: colorSemanticBlue100),
              insets: EdgeInsets.only(left: 0, right: 0, bottom: 0),
            ),
            labelPadding: EdgeInsets.symmetric(horizontal: 36.0),
            controller: controller.tabCtrl,
              onTap: (value) {
                controller.onChangeTab(value);
              }

          ),

          backgroundColor: Colors.white,
          leading: BackButton(
            color: colorBlack,
          ),
          title: Text(
            LocaleKeys.label_transactionHistory.tr,
            style: typoBold24,
          ),
          centerTitle: true,

        ),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                controller.tabIndex.value == 0
                 ? CourseMoneyHistory()
                    : controller.tabIndex.value == 1
                    ? BookMoneyHistory()
                    : ExamHistoryMoney(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context,
      {String? nameDH,
      String? date,
      Status? status,
      int? amount,
      List<OrderItem>? orderItem}) {
    return Container(
      // color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        color: colorWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nameDH!,
                  style: typoBold18,
                ),
                Row(
                  children: [
                    Text(
                      "$date ",
                      style: typoRegular12,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(R.ASSETS_SVG_ARROW_CIRCLE_RIGH_SVG)
                  ],
                )
              ],
            ),
            Wrap(
              children: orderItem!
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                  R.ASSETS_SVG_ICF_LEARNNING_PROGRESS_SVG),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width - 64) /
                                        2,
                                child: Text(
                                 e.inforProduct==null?"No name": e.inforProduct?.course?.title ?? "",
                                  style: typoRegular14,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'X${e.quantity} tháng',
                            style: typoRegular14,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      color: status == Status.complete
                          ? colorSemanticGreen20
                          : status == Status.pending
                              ? colorSemanticYellow100
                              : colorSemanticRed20,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text(
                      status == Status.complete
                          ? "Thành công"
                          : status == Status.pending
                              ? "Đang chờ xác nhận"
                              : "Đã bị hủy",
                      style: typoSemiBold10.copyWith(
                          color: status == Status.complete
                              ? colorSemanticGreen100
                              : status == Status.pending
                                  ? colorNeutralGray100
                                  : colorSemanticRed100),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      formatter.format(amount),
                      style:
                          typoSemiBold10.copyWith(color: colorSemanticRed100),
                    ),
                    Text(
                      LocaleKeys.general_moneyUnit.tr,
                      style:
                          typoSemiBold10.copyWith(color: colorSemanticRed100),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ExamHistoryMoney extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       return Container(
         height: 570,
         child: Center(
           child: Text("Tính năng đang được phát triển",textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontSize: 20),),),
       );
  }
}

class BookMoneyHistory extends StatelessWidget{
  final  controller = Get.find<TransactionHistoryController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: controller.listOrderBookHistory.length > 0
      ? Container(
        child: Obx(
            () => Wrap(
            children: controller.listOrderBookHistory
                .map((e) => Padding(
              padding: EdgeInsets.only(top: 24),
              child: InkWell(
                onTap: (){
                  Get.toNamed(Routes.TRANSACTION_DETAIL,arguments: e.id);
                },
                child: buildItem(
                  context,
                  amount: e.finalAmount,
                  nameDH:
                  "DH${e.id.toString().substring(e.id.toString().length - 6)}",
                  date:
                  "${fullStringTimerFormat(DateTime.fromMillisecondsSinceEpoch(e.orderDate!.toInt() * 1000).toString())} ngày ${fullStringTimeFormat(DateTime.fromMillisecondsSinceEpoch(e.orderDate!.toInt() * 1000).toString())}",
                  status: e.orderStatus == "complete"
                      ? Status.complete
                      : e.orderStatus == "pending"
                      ? Status.pending
                      : Status.error,
                  orderItems: e.orderItemss,
                ),
              ),
            ))
                .toList(),
          ),
        ),
      )
      : Container(
        height: 570,
        child: Center(
          child: Text("Bạn chưa mua quyển sách nào",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color:Colors.blue ),),),
      )


    );
  }
  Widget buildItem(BuildContext context, {String? nameDH, String? date, Status? status, int? amount, List<OrderItemss>? orderItems}) {
    return Container(
      // color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        color: colorWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nameDH!,
                  style: typoBold18,
                ),
                Row(
                  children: [
                    Text(
                      "$date ",
                      style: typoRegular12,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(R.ASSETS_SVG_ARROW_CIRCLE_RIGH_SVG)
                  ],
                )
              ],
            ),
            Wrap(
              children: orderItems!
                  .map(
                    (e) => Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                              R.ASSETS_SVG_ICF_LEARNNING_PROGRESS_SVG),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            width:
                            (MediaQuery.of(context).size.width - 64) /
                                2,
                            child: Text(
                              e.infoProduct==null?"No name": e.infoProduct!.book!.title!,
                              style: typoRegular14,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'X${e.quantity} tháng',
                        style: typoRegular14,
                      ),
                    ],
                  ),
                ),
              )
                  .toList(),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      color: status == Status.complete
                          ? colorSemanticGreen20
                          : status == Status.pending
                          ? colorSemanticYellow100
                          : colorSemanticRed20,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text(
                      status == Status.complete
                          ? "Thành công"
                          : status == Status.pending
                          ? "Đang chờ xác nhận"
                          : "Đã bị hủy",
                      style: typoSemiBold10.copyWith(
                          color: status == Status.complete
                              ? colorSemanticGreen100
                              : status == Status.pending
                              ? colorNeutralGray100
                              : colorSemanticRed100),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      formatter.format(amount),
                      style:
                      typoSemiBold10.copyWith(color: colorSemanticRed100),
                    ),
                    Text(
                      LocaleKeys.general_moneyUnit.tr,
                      style:
                      typoSemiBold10.copyWith(color: colorSemanticRed100),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CourseMoneyHistory extends StatelessWidget {
  final  controller = Get.find<TransactionHistoryController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: controller.listOrderHistory.length  != null
      ? Container(
          child: Obx(
                ()=> Wrap(
              children: controller.listOrderHistory
                  .map((e) => Padding(
                padding: EdgeInsets.only(top: 24),
                child: InkWell(
                  onTap: (){
                    Get.toNamed(Routes.TRANSACTION_DETAIL,arguments: e.id);
                  },
                  child: buildItem(
                    context,
                    amount: e.finalAmount,
                    nameDH:
                    "DH${e.id.toString().substring(e.id.toString().length - 6)}",
                    date:
                    "${fullStringTimerFormat(DateTime.fromMillisecondsSinceEpoch(e.orderDate!.toInt() * 1000).toString())} ngày ${fullStringTimeFormat(DateTime.fromMillisecondsSinceEpoch(e.orderDate!.toInt() * 1000).toString())}",
                    status: e.orderStatus == "complete"
                        ? Status.complete
                        : e.orderStatus == "pending"
                        ? Status.pending
                        : Status.error,
                    orderItem: e.orderItems,
                  ),
                ),
              ))
                  .toList(),
            ),
          ),
        )
        :  Container(
        height: 570,
        child: Center(
          child: Text("Bạn chưa mua khóa học  nào vui lòng mua khóa học",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color:Colors.blue ),),),
      )

    );
  }
  Widget buildItem(BuildContext context,
      {String? nameDH,
        String? date,
        Status? status,
        int? amount,
        List<OrderItem>? orderItem}) {
    return Container(
      // color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        color: colorWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nameDH!,
                  style: typoBold18,
                ),
                Row(
                  children: [
                    Text(
                      "$date ",
                      style: typoRegular12,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(R.ASSETS_SVG_ARROW_CIRCLE_RIGH_SVG)
                  ],
                )
              ],
            ),
            Wrap(
              children: orderItem!
                  .map(
                    (e) => Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                              R.ASSETS_SVG_ICF_LEARNNING_PROGRESS_SVG),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            width:
                            (MediaQuery.of(context).size.width - 64) /
                                2,
                            child: Text(
                              e.inforProduct==null?"No name": e.inforProduct?.course?.title ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: typoRegular14,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'X${e.quantity} tháng',
                        style: typoRegular14,
                      ),
                    ],
                  ),
                ),
              )
                  .toList(),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      color: status == Status.complete
                          ? colorSemanticGreen20
                          : status == Status.pending
                          ? colorSemanticYellow100
                          : colorSemanticRed20,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Text(
                      status == Status.complete
                          ? "Thành công"
                          : status == Status.pending
                          ? "Đang chờ xác nhận"
                          : "Đã bị hủy",
                      style: typoSemiBold10.copyWith(
                          color: status == Status.complete
                              ? colorSemanticGreen100
                              : status == Status.pending
                              ? colorNeutralGray100
                              : colorSemanticRed100),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      formatter.format(amount),
                      style:
                      typoSemiBold10.copyWith(color: colorSemanticRed100),
                    ),
                    Text(
                      LocaleKeys.general_moneyUnit.tr,
                      style:
                      typoSemiBold10.copyWith(color: colorSemanticRed100),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
