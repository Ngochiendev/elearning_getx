import 'package:elearning/app/components/app_text_button.dart';
import 'package:elearning/app/data/models/book_models/rating_book_model.dart';
import 'package:elearning/app/modules/cource_views/coure_learn/controllers/coure_learn_controller.dart';
import 'package:elearning/app/modules/ebook_views.dart/ebook_details/controllers/ebook_details_controller.dart';
import 'package:elearning/app/modules/main_screen/book_progress/controllers/book_progress_controller.dart';
import 'package:elearning/app/themes/colors.dart';
import 'package:elearning/app/themes/text_styles.dart';
import 'package:elearning/generated/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
class RatetingCourse extends StatelessWidget {

  List<String> recomment = [
    "Bài tập rất bổ ích",
    "Khóa học bổ ích",
    "Giáo viên dạy rất hay",
   
  ];
  voteBook(BuildContext context, BookProgressController controller,int idBook,{List<Rating>? myRating}) {

  }
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CoureLearnController>();
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 13),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Đánh giá khóa học",
                style: typoBold18.copyWith(color: colorNeutralGray90),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 26,
              ),
             controller.myrating.value.data?.rating!=null?RatingBarIndicator(
              rating: controller.myvote.value.toDouble(),
              itemBuilder: (context, index) =>SvgPicture.asset(R.ASSETS_SVG_IC_STAR_YELLOW_SVG),
              itemCount: 5,
              itemSize: 32.0,
              unratedColor: Colors.grey,
              direction:Axis.horizontal,
            ) :RatingBar.builder(
              initialRating: 0.0,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: false,
              unratedColor: Colors.grey.withOpacity(0.2),
              itemCount: 5,
              itemSize: 32.0,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => SvgPicture.asset(
                R.ASSETS_SVG_IC_STAR_YELLOW_SVG,
              ),
              updateOnDrag: true,
              tapOnlyMode: false,
              onRatingUpdate: (double value) {
                print(value.toInt());
                controller.onchangeVote(value.toInt());
              },
            ),
            SizedBox(
                height: 26,
              ),
              Container(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: recomment
                      .map((e) => Container(
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.all(Radius.circular(40))),
                    child: InkWell(
                      onTap:controller.myrating.value.data?.rating!=null?null :(){
                        controller.onChangeComment(e);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        height: 40,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            color: colorPrimaryBlue5,
                            borderRadius:
                            BorderRadius.all(Radius.circular(40))),
                        child: Center(
                            child: Text(e,
                              style: typoRegular14,
                            )),
                      ),
                    ),
                  ))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                  height: 90,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: colorNeutralGray40),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: CupertinoTextField(
                    readOnly: controller.myrating.value.data?.rating==null?false:true,
                    controller: controller.ratingCtrl,
                    maxLines: 16,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    placeholder: "Nhận xét của bạn",
                    placeholderStyle: typoRegular14,
                  )
              ),
              SizedBox(
                height: 26,
              ),
              Container(
                width: 208,
                height: 40,
                decoration: BoxDecoration(
                    color: colorPrimaryBlue100,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: AppTextButton(
                  buttonTitle: "Gửi đánh giá ",
                  color: colorWhite,
                  onPressed:controller.myrating.value.data?.rating==null?(){
                    controller.getRatingCourse(controller.idCousers.value, controller.vote.value, controller.ratingCtrl.text);
                  }:null,
                ),
              ),

            ],
          ),
        ),

    );
  }
 
}
