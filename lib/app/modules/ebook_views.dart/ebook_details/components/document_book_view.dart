import 'package:elearning/app/modules/ebook_views.dart/ebook_details/controllers/ebook_details_controller.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/app/utils/app_utils.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentBookPage extends StatelessWidget {
  final controller = Get.find<EbookDetailsController>();
  DocumentBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: controller.documents
          .map(
            (element) => InkWell(
              onTap: () {
                launch(element.source ?? "");
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: colorNeutralGray5),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFE5F3FE),
                            border: Border.all(
                              width: 1,
                              color: Color(0xFFE5F3FE),
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            )),
                        width: 80,
                        height: 80,
                        padding: EdgeInsets.all(20),
                        child: Container(
                           width: 2,
                            height:5,
                          child: SvgPicture.asset(
                            R.ASSETS_SVG_IC_DOCX_SVG,
                    
                          ),
                        )),
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Text(element.fileName ?? "",
                                style: typoBold14)),
                        RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(children: [
                              TextSpan(
                                text: fullStringTimeFormat(
                                    element.updatedAt ?? ""),
                                style: typoRegular12.copyWith(
                                    color: colorNeutralGray60),
                              ),
                              TextSpan(text: "   "),
                              TextSpan(
                                text: element.fileType ?? "",
                                style: typoRegular12.copyWith(
                                    color: colorNeutralGray60),
                              ),
                            ])),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
