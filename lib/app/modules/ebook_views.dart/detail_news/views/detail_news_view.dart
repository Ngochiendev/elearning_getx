import 'dart:ui';

import 'package:elearning/app/components/app_network_image.dart';
import 'package:elearning/app/themes/app_styles.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/detail_news_controller.dart';

class DetailNewsView extends GetView<DetailNewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Chi tiết tin tức',
            style: typoBold16,
          ),
          centerTitle: true,
          leading: BackButton(
            color: colorBlack,
          ),
        ),
        body: Scaffold(
          backgroundColor: colorWhite,
          body: SafeArea(
            bottom: true,
            child: Scrollbar(
              thickness: 7,
              radius: Radius.circular(15),
              isAlwaysShown: true,
              showTrackOnHover: true,
              child: SingleChildScrollView(
                controller: controller.scrollController,
                child: Obx(
                  () => Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                          ),
                          child: AppNetworkImage(
                            source: controller.news.value.thumbnail ?? "",
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
                                  text: controller.news.value.author ?? "",
                                  style: typoRegular14.copyWith(
                                      color: colorNeutralGray600),
                                ),
                                TextSpan(text: "   "),
                                TextSpan(
                                  text: fullStringTimeFormat(
                                      controller.time.value),
                                  style: typoRegular14.copyWith(
                                      color: colorNeutralGray90),
                                ),
                              ])),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, left: 8, right: 8),
                          child: Text(
                            controller.news.value.title ?? "",
                            style: typoBold14,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8, left: 8, right: 8),
                          child: controller.news.value.content != null ||
                                  controller.news.value.content != ""
                              ? HtmlWidget(
                                  controller.news.value.content.toString(),
                                  textStyle: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    letterSpacing: 1.02,
                                    color: colorNeutralGray90,
                                  ),
                                  // ignore: deprecated_member_use
                                  webView: true,
                                  // ignore: deprecated_member_use
                                  webViewJs: true,
                                  onTapUrl: (url) => launch(url),
                                  renderMode: RenderMode.column,
                                  // style: {
                                  //   '#': Style(
                                  //     fontStyle: FontStyle.normal,
                                  //     fontWeight: FontWeight.w300,
                                  //     fontSize: FontSize(14),
                                  //     letterSpacing: 1.02,
                                  //     color: colorNeutralGray90,
                                  //   ),
                                  // },
                                )
                              : GestureDetector(),
                        ),
                        Divider(
                          height: 4,
                          color: colorNeutralGray100,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Tin tức liên quan", style: typoBold20),
                            ],
                          ),
                        ),
                        controller.newss.length > 0 &&
                                controller.newss.length != null
                            ? Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                height: 270,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.newss.length,
                                  itemBuilder: (context, e) {
                                    final time = controller.newss[e].updatedAt;
                                    return GestureDetector(
                                      onTap: () async {
                                        controller.scrollController.animateTo(
                                          controller.scrollController.position
                                              .minScrollExtent,
                                          duration: Duration(seconds: 1),
                                          curve: Curves.fastOutSlowIn,
                                        );
                                        await controller.getdetailNews(
                                            controller.newss[e].id!);
                                        await controller.getlistNews();
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                120,
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            color: colorWhite,
                                            boxShadow: boxShadow),
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 170,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8)),
                                              ),
                                              child: AppNetworkImage(
                                                source: controller
                                                        .newss[e].thumbnail ??
                                                    "",
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: RichText(
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                      text: controller.newss[e]
                                                              .author ??
                                                          "",
                                                      style: typoRegular14.copyWith(
                                                          color:
                                                              colorNeutralGray600),
                                                    ),
                                                    TextSpan(text: "   "),
                                                    TextSpan(
                                                      text:
                                                          fullStringTimeFormat(
                                                              time),
                                                      style: typoRegular14.copyWith(
                                                          color:
                                                              colorNeutralGray90),
                                                    ),
                                                  ])),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8, left: 8, right: 8),
                                              child: Text(
                                                controller.newss[e].title ?? "",
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
                            : CircularProgressIndicator(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
