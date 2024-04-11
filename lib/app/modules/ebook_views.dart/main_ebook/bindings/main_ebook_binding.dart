import 'package:elearning/app/modules/ebook_views.dart/ebook/controllers/ebook_controller.dart';
import 'package:elearning/app/modules/ebook_views.dart/read_ebook/controllers/read_ebook_controller.dart';
import 'package:elearning/app/modules/ebook_views.dart/search_ebook/controllers/search_ebook_controller.dart';
import 'package:elearning/app/modules/eexam_views/eexam/controllers/eexam_controller.dart';
import 'package:elearning/app/modules/main_screen/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/main_ebook_controller.dart';

class MainEbookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainEbookController>(
      () => MainEbookController(),
    );
    Get.lazyPut<EbookController>(
      () => EbookController(),
    );
    Get.lazyPut<SearchEbookController>(
      () => SearchEbookController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<ReadEbookController>(
      () => ReadEbookController(),
    );

  }
}
