import 'package:elearning/app/modules/ebook_views.dart/ebook_details/controllers/ebook_details_controller.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationBookPage extends StatelessWidget {
  final controller = Get.find<EbookDetailsController>();
  InformationBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: MediaQuery.of(context).size.width,
      decoration:BoxDecoration(
        border: Border.all(color: colorNeutralGray5)
      ),
      child: Wrap(
        direction: Axis.vertical,
        children: controller.informations
            .map(
              (element) => Container(
                margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(text: "${element.key}: ", style: typoBold14),
                      TextSpan(text: element.value, style: typoRegular14),
                    ]))
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
