import 'dart:io';
import 'dart:math';

import 'package:chewie/chewie.dart';
import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/components/app_text_button.dart';
import 'package:elearning/app/data/models/book_models/reading_book_model.dart';
import 'package:elearning/app/modules/ebook_views.dart/ebook_details/controllers/ebook_details_controller.dart';
import 'package:elearning/app/modules/ebook_views.dart/read_book/views/view_book_image.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elearning/generated/resource.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:page_turn/page_turn.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/read_book_controller.dart';

class ReadBookView extends GetView<ReadBookController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: _scaffoldKey,
        endDrawer: MenuTableContent(
          controller: controller,
        ),
        endDrawerEnableOpenDragGesture: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            controller.name.value,
            style: typoBold16,
          ),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Get.back(result: "");
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          actions: [
            InkWell(
              onTap: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
              child: Container(
                  margin: EdgeInsets.only(right: 19.6),
                  child: Icon(
                    Icons.menu,
                    color: colorBlack,
                  )),
            )
          ],
        ),
        body: Stack(
          children: [
            pdfBooks(context),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: footerReadingBook(context)),
          ],
        ),
      ),
    );
  }

  pdfBooks(BuildContext context) => Container(
      // color: Colors.red,

      padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 120),
      height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      child:
          //  PageTurn(
          //   key: pageturn,
          //   backgroundColor: Colors.white,
          //   showDragCutoff: false,
          //   lastPage: Container(child: Center(child: Text('Last Page!'))),
          //   children: <Widget>[
          //     for (var i = 0; i < controller.books.value.length; i++)
          //       Container(
          //           // color: Colors.red,
          //           margin: EdgeInsets.symmetric(horizontal: 16),
          //           child: Image.network(controller.books.value[i] ?? '',
          //               fit: BoxFit.cover,
          //               height: MediaQuery.of(context).size.height,
          //               width: MediaQuery.of(context).size.width,
          //               alignment: Alignment.center)),
          //   ],
          // )
          PageView.builder(
        onPageChanged: (index) {
          controller.readBook("${controller.listBook[index].id!}");

          controller.onChangePage(index);
          // controller.listAttachment.clear();
          // controller.listAttachment.value=controller.listBook[index].attachments!;
        },
        scrollDirection: Axis.horizontal,
        itemCount: controller.books.length,
        itemBuilder: (context, id) => Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 0),
          child: buildImage(controller, id, context, controller.listAttachment),
        ),
      )
      // child: AppNetworkImage(
      //     source: controller.books.value[id] ?? "",
      //     fit: BoxFit.contain,
      //
      // ),

      );
  Widget buildImage(ReadBookController controller, int id, BuildContext context,
      List<Attachment> atact) {
    return Builder(builder: (context) {
      return Obx(
        () => Container(
          child: Stack(
            children: [
              Positioned.fill(
                child: InteractiveViewer(
                  maxScale: 4,
                  minScale: 1,
                  clipBehavior: Clip.none,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: AppNetworkImage(
                      source:
                          "https://flextech-dev.s3-ap-southeast-1.amazonaws.com/${controller.books[id]}",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              for (int i = 0; i < atact.length; i++)
                Positioned(
                  left: (MediaQuery.of(context).size.width - 64) *
                      (atact[i].verticalPosition! / 100),
                  top: (MediaQuery.of(context).size.width + 136) *
                      (atact[i].horizontalPosition! / 100),
                  child: InkWell(
                    onTap: () async {
                      if (checkTypeButton(atact[i].type!) == 1) {
                        await controller.playVideoPopup(atact[i].source!);
                        showDialog(
                          context: Get.context!,
                          builder: (BuildContext context) => Dialog(
                            child: playVideoUrl(controller),
                          ),
                        ).then((value) => {
                              controller.videoPlayerController!.pause(),
                              // controller.isPlaying.value = true
                            });
                      } else if (checkTypeButton(atact[i].type!) == 2) {
                        print(atact[i].source);
                        showDialog(
                          context: Get.context!,
                          builder: (BuildContext context) => Dialog(
                            child: playSpeakUrl(controller, atact[i].source!),
                          ),
                        ).then((value) => {
                              controller.audioPlayerUrl.pause(),
                              controller.isPlayingUrl.value = true
                            });
                      } else if (checkTypeButton(atact[i].type!) == 3) {
                        print("sss");
                        // controller.speak(atact[i].content!);

                        showDialog(
                          context: Get.context!,
                          builder: (BuildContext context) => Dialog(
                              child: playSpeak(controller, atact[i].content!)),
                        ).then((value) async {
                          if (Platform.isIOS) {
                            controller.flutterTts.pause();
                          } else {
                            var res = await controller.flutterTts.stop();
                            if (res == 1) controller.isPlaying.value = true;
                          }
                        });
                      } else {
                        showDialog(
                          context: Get.context!,
                          builder: (BuildContext context) => Dialog(
                            child: showHtml(atact[i].content!),
                          ),
                        );
                      }
                    },
                    child: Container(
                      // padding: EdgeInsets.symmetric(horizontal: 8),
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      width: 44,
                      height: 44,
                      child: Image.asset(
                          checkTypeButton(atact[i].type!) == 1
                              ? R.ASSETS_PNG_IC_PLAYREADBOOK_PNG
                              : checkTypeButton(atact[i].type!) == 2
                                  ? R.ASSETS_PNG_IC_VOLUMN_PNG
                                  : checkTypeButton(atact[i].type!) == 3
                                      ? R.ASSETS_PNG_IC_VOLUMN_PNG
                                      : R.ASSETS_PNG_IC_ATTACKFILE_PNG,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }

  Widget playSpeak(ReadBookController controller, String text) {
    return Obx(
      () => Container(
        height: 185,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text(
                    text,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  )),
                ],
              ),
            ),
            // Container(
            //   child: Slider(
            //       activeColor: Colors.red,
            //       inactiveColor: Colors.grey,
            //       value: controller.position.value.inSeconds.toDouble(),
            //       min: 0.0,
            //       max: controller.duraation.value.inSeconds.toDouble(),
            //       onChanged: (value) {
            //         controller.audioPlayer
            //             .seek(Duration(seconds: value.toInt()));
            //       }),
            // ),
            IconButton(
                onPressed: () {
                  controller.speak(text);
                },
                icon: controller.isPlaying.value
                    ? Icon(
                        controller.iconData[0],
                        size: 32,
                      )
                    : Icon(
                        controller.iconData[1],
                        size: 32,
                      )),
          ],
        ),
      ),
    );
  }

  Widget playSpeakUrl(ReadBookController controller, String url) {
    return Obx(
      () => Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(controller.positionUrl.value.toString().split(".")[0]),
                  Text(controller.duraationUrl.value.toString().split(".")[0]),
                ],
              ),
            ),
            Container(
              child: Slider(
                  activeColor: Colors.red,
                  inactiveColor: Colors.grey,
                  value: controller.positionUrl.value.inSeconds.toDouble(),
                  min: 0.0,
                  max: controller.duraationUrl.value.inSeconds.toDouble(),
                  onChanged: (double value) {
                    controller.changePositonUrl(value.toInt());
                  }),
            ),
            IconButton(
                onPressed: () {
                  controller.PlayAudioToUrl(
                      controller.isPlayingUrl.value =
                          !controller.isPlayingUrl.value,
                      url);
                },
                icon: controller.isPlayingUrl.value
                    ? Icon(
                        controller.iconData[0],
                        size: 32,
                      )
                    : Icon(
                        controller.iconData[1],
                        size: 32,
                      )),
          ],
        ),
      ),
    );
  }

  Widget playVideoUrl(ReadBookController controller) {
    return Container(
      height: 240,
      width: double.infinity,
      child: controller.chewieController != null &&
              controller
                  .chewieController!.videoPlayerController.value.isInitialized
          ? Chewie(
              controller: controller.chewieController!,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text('Loading'),
              ],
            ),
      margin: EdgeInsets.only(
        bottom: 16,
      ),
    );
  }

  Widget showHtml(String content) {
    return Container(
      height: 240,
      width: double.infinity,
      child: HtmlWidget(
        content,

        // ignore: deprecated_member_use
        webView: true,
        // ignore: deprecated_member_use
        webViewJs: true,
        onTapUrl: (url) => launch(url),
      ),
    );
  }

  footerReadingBook(BuildContext context) => Container(
        decoration: BoxDecoration(
          boxShadow: boxShadow,
          color: colorWhite,
        ),
        width: MediaQuery.of(context).size.width,
        height: 100,
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Visibility(
              visible: controller.listExercises.length > 0,
              child: Expanded(
                  child: InkWell(
                onTap: () => showCupertinoModalBottomSheet(
                  expand: false,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => buildExercises(controller, context),
                ),
                child: Container(
                  height: 42,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: colorSemanticBlue100),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        R.ASSETS_SVG_IC_GAMESTATION_SVG,
                        width: 26,
                        height: 26,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        "Làm bài tập",
                        style: typoBold16.copyWith(color: colorWhite),
                      )
                    ],
                  ),
                ),
              )
                  //      ElevatedButtonBase(
                  //   height: 40,
                  //   size: 14,
                  //   weight: FontWeight.w700,
                  //   buttonTitle: "Làm bài tập",
                  //   onPressed: () async {
                  //     Get.back();
                  //   },
                  // )
                  ),
            ),
          ],
        ),
      );
}

Widget buildExercises(ReadBookController controller, BuildContext context) {
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
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                      R.ASSETS_SVG_ION_GAME_CONTROLLER_OUTLINE_SVG),
                  SizedBox(
                    width: 19,
                  ),
                  Text(
                    "Làm bài tập",
                    style: typoBalo18.copyWith(color: colorPrimaryBlue100),
                  ),
                ],
              ),
              Wrap(
                children: controller.listExercises
                    .map((e) => InkWell(
                          onTap: () {
                            controller.demoToExercise(
                                "${e.id}", "${e.exerciseId}");
                            Get.back();
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 18,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(R.ASSETS_SVG_PENCIL_SVG),
                                  SizedBox(
                                    width: 19,
                                  ),
                                  Text(
                                    "Bài tập số ${e.exerciseId!.toString()}",
                                    style: typoRegular14.copyWith(
                                        color: colorNeutralGray60),
                                  ),
                                ],
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

class MenuTableContent extends StatefulWidget {
  final ReadBookController? controller;
  const MenuTableContent({Key? key, this.controller}) : super(key: key);

  @override
  _MenuTableContentState createState() => _MenuTableContentState();
}

class _MenuTableContentState extends State<MenuTableContent> {
  final ebookControler = Get.find<EbookDetailsController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        top: true,
        child: Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child:
                            SvgPicture.asset(R.ASSETS_SVG_IC_ROUND_CANCEL_SVG)),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(40))),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  widget.controller!.name.value,
                                  style: typoBold18,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                widget.controller!.listContent.length == 0
                                    ? Container()
                                    : Wrap(
                                        children: widget.controller!.listContent
                                            .map((e) => Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            e.title!,
                                                            style: typoBold18,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 16,
                                                    ),
                                                    Divider(
                                                      color: Colors.grey,
                                                    ),
                                                    SizedBox(
                                                      height: 16,
                                                    ),
                                                    Wrap(
                                                      children: e.children!
                                                          .map(
                                                            (e) => Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Flexible(
                                                                          child:
                                                                              Text(
                                                                        e.title!,
                                                                        style:
                                                                            typoRegular14,
                                                                      )),
                                                                      Text(
                                                                        "${e.pageFrom}",
                                                                        style:
                                                                            typoRegular12,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 16,
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                          .toList(),
                                                    ),
                                                  ],
                                                ))
                                            .toList(),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 158,
                          width: size.width,
                          child: ebookControler.bookDetailModel.value
                                      .isAlreadyPurchased ==
                                  1
                              ? buildExpPage(ebookControler)
                              : buildtrailPage(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildtrailPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              R.ASSETS_SVG_INFORMATION_CIRCLE_SVG,
              color: Colors.red,
            ),
            SizedBox(
              width: 5,
            ),
            Flexible(
                child: Text(
              "Bạn đang dùng bản ĐỌC THỬ. Sở hữu ngay !",
              style: typoRegular14,
            )),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: colorSecondaryRed100,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                height: 36,
                child: AppTextButton(
                  textStyle: typoBold12.copyWith(color: colorWhite),
                  onPressed: () {},
                  buttonTitle: "Thêm vào giỏ",
                ),
              ),
            ),
            SizedBox(
              width: 9,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: colorSecondaryRed100),
                    color: colorSecondaryRed100.withOpacity(0.3),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                height: 36,
                child: AppTextButton(
                  textStyle: typoBold12.copyWith(color: colorSecondaryRed100),
                  onPressed: () => showCupertinoModalBottomSheet(
                    expand: false,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => buildProduct(context, ebookControler),
                  ),
                  buttonTitle: "Mua ngay",
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 9,
        ),
        Container(
          decoration: BoxDecoration(
              color: colorPrimaryBlue100,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          height: 36,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(R.ASSETS_SVG_IC_DOWNLOAD_SVG),
              AppTextButton(
                textStyle: typoBold12.copyWith(color: colorWhite),
                onPressed: () {},
                buttonTitle: "Tải xuống KẾT QUẢ BÀI TẬP",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildExpPage(EbookDetailsController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              R.ASSETS_SVG_INFORMATION_CIRCLE_SVG,
              color: colorPrimaryBlue100,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hạn sử dụng  Ấn để ',
                      style: typoRegular12,
                    ),
                    TextSpan(
                      text: 'Gia Hạn Sách',
                      style: typoRegular12.copyWith(
                        color: colorPrimaryBlue100,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: new TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
              color: colorPrimaryBlue100.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          height: 36,
          width: double.infinity,
          child: AppTextButton(
            textStyle: typoBold12.copyWith(color: colorWhite),
            onPressed: () {},
            buttonTitle: "Mua Lại",
          ),
        ),
        SizedBox(
          height: 9,
        ),
        Container(
          decoration: BoxDecoration(
              color: colorPrimaryBlue100,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          height: 36,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(R.ASSETS_SVG_IC_DOWNLOAD_SVG),
              AppTextButton(
                textStyle: typoBold12.copyWith(color: colorWhite),
                onPressed: () {},
                buttonTitle: "Tải xuống KẾT QUẢ BÀI TẬP",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildProduct(BuildContext context, EbookDetailsController controller) {
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
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      "Chọn gói mua",
                      style: typoBold18.copyWith(color: colorNeutralGray60),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Wrap(
                  children: controller.purchasePackages
                      .map((e) => Column(
                            children: [
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${e.duration ?? 0} Tháng",
                                    style: typoBold14,
                                  ),
                                  Text(
                                      "${formatter.format(e.retailPrice ?? 0)} đ",
                                      style: typoRegular14.copyWith(
                                          decoration:
                                              TextDecoration.lineThrough)),
                                  Text(
                                      "${formatter.format(e.discountPrice ?? 0)} đ",
                                      style: typoBalo18.copyWith(
                                          color: colorSemanticRed100))
                                ],
                              ),
                            ],
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
    ));
  }
}
