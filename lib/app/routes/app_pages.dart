import 'package:get/get.dart';

import '../modules/auth/change_password/bindings/change_password_binding.dart';
import '../modules/auth/change_password/bindings/change_password_binding.dart';
import '../modules/auth/change_password/views/change_password_view.dart';
import '../modules/auth/change_password/views/change_password_view.dart';
import '../modules/auth/forgot_pass/bindings/forgot_pass_binding.dart';
import '../modules/auth/forgot_pass/views/forgot_pass_view.dart';
import '../modules/auth/onboarding/bindings/onboarding_binding.dart';
import '../modules/auth/onboarding/views/onboarding_view.dart';
import '../modules/auth/signin/bindings/signin_binding.dart';
import '../modules/auth/signin/views/signin_view.dart';
import '../modules/auth/signup/bindings/signup_binding.dart';
import '../modules/auth/signup/views/signup_view.dart';
import '../modules/auth/splash/bindings/splash_binding.dart';
import '../modules/auth/splash/views/splash_view.dart';
import '../modules/cart_views/cart_discount_code/bindings/cart_discount_code_binding.dart';
import '../modules/cart_views/cart_discount_code/views/cart_discount_code_view.dart';
import '../modules/cart_views/cart_payment_banking/bindings/cart_payment_banking_binding.dart';
import '../modules/cart_views/cart_payment_banking/views/cart_payment_banking_view.dart';
import '../modules/cart_views/cart_product/bindings/cart_product_binding.dart';
import '../modules/cart_views/cart_product/views/cart_product_view.dart';
import '../modules/cart_views/payment_inapp_webview/bindings/payment_inapp_webview_binding.dart';
import '../modules/cart_views/payment_inapp_webview/views/payment_inapp_webview_view.dart';
import '../modules/cource_views/cource_details/bindings/cource_details_binding.dart';
import '../modules/cource_views/cource_details/views/cource_details_view.dart';
import '../modules/cource_views/coure_learn/bindings/coure_learn_binding.dart';
import '../modules/cource_views/coure_learn/views/coure_learn_view.dart';
import '../modules/cource_views/coure_trail_page/bindings/coure_trail_page_binding.dart';
import '../modules/cource_views/coure_trail_page/views/coure_trail_page_view.dart';
import '../modules/cource_views/course_homework_minigame/bindings/course_homework_minigame_binding.dart';
import '../modules/cource_views/course_homework_minigame/views/course_homework_minigame_view.dart';
import '../modules/cource_views/detail_category_product/bindings/detail_category_product_binding.dart';
import '../modules/cource_views/detail_category_product/views/detail_category_product_view.dart';
import '../modules/cource_views/detal_teacher/bindings/detal_teacher_binding.dart';
import '../modules/cource_views/detal_teacher/views/detal_teacher_view.dart';
import '../modules/cource_views/empty_view/bindings/empty_view_binding.dart';
import '../modules/cource_views/empty_view/views/empty_view_view.dart';
import '../modules/cource_views/home_course/bindings/home_course_binding.dart';
import '../modules/cource_views/home_course/views/home_course_view.dart';
import '../modules/cource_views/main_course/bindings/main_course_binding.dart';
import '../modules/cource_views/main_course/views/main_course_view.dart';
import '../modules/cource_views/result_search/bindings/result_search_binding.dart';
import '../modules/cource_views/result_search/views/result_search_view.dart';
import '../modules/cource_views/search/bindings/search_binding.dart';
import '../modules/cource_views/search/views/search_view.dart';
import '../modules/cource_views/user_course_detail/bindings/user_course_detail_binding.dart';
import '../modules/cource_views/user_course_detail/views/user_course_detail_view.dart';
import '../modules/detail_couourse_teacher/bindings/detail_couourse_teacher_binding.dart';
import '../modules/detail_couourse_teacher/views/detail_couourse_teacher_view.dart';
import '../modules/ebook_views.dart/detail_category_book/bindings/detail_category_book_binding.dart';
import '../modules/ebook_views.dart/detail_category_book/views/detail_category_book_view.dart';
import '../modules/ebook_views.dart/detail_news/bindings/detail_news_binding.dart';
import '../modules/ebook_views.dart/detail_news/views/detail_news_view.dart';
import '../modules/ebook_views.dart/ebook/bindings/ebook_binding.dart';
import '../modules/ebook_views.dart/ebook/views/ebook_view.dart';
import '../modules/ebook_views.dart/ebook_details/bindings/ebook_details_binding.dart';
import '../modules/ebook_views.dart/ebook_details/components/rate_book_view.dart';
import '../modules/ebook_views.dart/ebook_details/views/ebook_details_view.dart';
import '../modules/ebook_views.dart/main_ebook/bindings/main_ebook_binding.dart';
import '../modules/ebook_views.dart/main_ebook/views/main_ebook_view.dart';
import '../modules/ebook_views.dart/my_ebook/bindings/my_ebook_binding.dart';
import '../modules/ebook_views.dart/my_ebook/views/my_ebook_view.dart';
import '../modules/ebook_views.dart/read_book/bindings/read_book_binding.dart';
import '../modules/ebook_views.dart/read_book/views/read_book_view.dart';
import '../modules/ebook_views.dart/read_ebook/bindings/read_ebook_binding.dart';
import '../modules/ebook_views.dart/read_ebook/views/read_ebook_view.dart';
import '../modules/ebook_views.dart/result_search_ebook/bindings/result_search_ebook_binding.dart';
import '../modules/ebook_views.dart/result_search_ebook/views/result_search_ebook_view.dart';
import '../modules/ebook_views.dart/search_ebook/bindings/search_ebook_binding.dart';
import '../modules/ebook_views.dart/search_ebook/views/search_ebook_view.dart';
import '../modules/eexam_views/eexam/bindings/eexam_binding.dart';
import '../modules/eexam_views/eexam/views/eexam_view.dart';
import '../modules/eexam_views/exam_detail/bindings/exam_detail_binding.dart';
import '../modules/eexam_views/exam_detail/views/exam_detail_view.dart';
import '../modules/eexam_views/main_eexam/bindings/main_eexam_binding.dart';
import '../modules/eexam_views/main_eexam/views/main_eexam_view.dart';
import '../modules/eexam_views/result_search_exam/bindings/result_search_exam_binding.dart';
import '../modules/eexam_views/result_search_exam/views/result_search_exam_view.dart';
import '../modules/eexam_views/search_exam/bindings/search_exam_binding.dart';
import '../modules/eexam_views/search_exam/views/search_exam_view.dart';
import '../modules/exercise_info/bindings/exercise_info_binding.dart';
import '../modules/exercise_info/views/exercise_info_view.dart';
import '../modules/exercise_list/bindings/exercise_list_binding.dart';
import '../modules/exercise_list/views/exercise_list_view.dart';
import '../modules/exercise_result/bindings/exercise_result_binding.dart';
import '../modules/exercise_result/views/exercise_result_view.dart';
import '../modules/exercise_step/bindings/exercise_step_binding.dart';
import '../modules/exercise_step/views/exercise_step_view.dart';
import '../modules/live_class_pages/live_class_handup/bindings/live_class_handup_binding.dart';
import '../modules/live_class_pages/live_class_handup/views/live_class_handup_view.dart';
import '../modules/live_class_pages/live_class_home/bindings/live_class_home_binding.dart';
import '../modules/live_class_pages/live_class_home/views/live_class_home_view.dart';
import '../modules/live_class_pages/live_class_login/bindings/live_class_login_binding.dart';
import '../modules/live_class_pages/live_class_login/views/live_class_login_view.dart';
import '../modules/live_class_pages/live_class_members/bindings/live_class_members_binding.dart';
import '../modules/live_class_pages/live_class_members/views/live_class_members_view.dart';
import '../modules/live_class_pages/live_class_message/bindings/live_class_message_binding.dart';
import '../modules/live_class_pages/live_class_message/views/live_class_message_view.dart';
import '../modules/live_class_pages/live_class_notificaiton/bindings/live_class_notificaiton_binding.dart';
import '../modules/live_class_pages/live_class_notificaiton/views/live_class_notificaiton_view.dart';
import '../modules/live_class_pages/live_class_onboard/bindings/live_class_onboard_binding.dart';
import '../modules/live_class_pages/live_class_onboard/views/live_class_onboard_view.dart';
import '../modules/live_class_pages/live_class_require_joinclass/bindings/live_class_require_joinclass_binding.dart';
import '../modules/live_class_pages/live_class_require_joinclass/views/live_class_require_joinclass_view.dart';
import '../modules/live_class_pages/live_class_textbook/bindings/live_class_textbook_binding.dart';
import '../modules/live_class_pages/live_class_textbook/views/live_class_textbook_view.dart';
import '../modules/main_screen/book_progress/bindings/book_progress_binding.dart';
import '../modules/main_screen/book_progress/bindings/book_progress_binding.dart';
import '../modules/main_screen/book_progress/views/book_progress_view.dart';
import '../modules/main_screen/book_progress/views/book_progress_view.dart';
import '../modules/main_screen/home/bindings/home_binding.dart';
import '../modules/main_screen/home/views/home_view.dart';
import '../modules/main_screen/leaarn_certificate/bindings/leaarn_certificate_binding.dart';
import '../modules/main_screen/leaarn_certificate/views/leaarn_certificate_view.dart';
import '../modules/main_screen/leaarn_exercise/bindings/leaarn_exercise_binding.dart';
import '../modules/main_screen/leaarn_exercise/views/leaarn_exercise_view.dart';
import '../modules/main_screen/leaarn_exercise_resoult/bindings/leaarn_exercise_resoult_binding.dart';
import '../modules/main_screen/leaarn_exercise_resoult/views/leaarn_exercise_result_view.dart';
import '../modules/main_screen/learning_progress/bindings/learning_progress_binding.dart';
import '../modules/main_screen/learning_progress/views/learning_progress_view.dart';
import '../modules/main_screen/main/bindings/main_binding.dart';
import '../modules/main_screen/main/views/main_view.dart';
import '../modules/main_screen/notification/bindings/notification_binding.dart';
import '../modules/main_screen/notification/views/notification_view.dart';
import '../modules/main_screen/point_history/bindings/point_history_binding.dart';
import '../modules/main_screen/point_history/views/point_history_view.dart';
import '../modules/main_screen/profile/bindings/profile_binding.dart';
import '../modules/main_screen/profile/views/contacs.dart';
import '../modules/main_screen/profile/views/edit_profile_view.dart';
import '../modules/main_screen/profile/views/profile_view.dart';
import '../modules/main_screen/profile/views/setting_view.dart';
import '../modules/main_screen/profile/views/setting_view.dart';
import '../modules/main_screen/transaction_user/transaction_detail/bindings/transaction_detail_binding.dart';
import '../modules/main_screen/transaction_user/transaction_detail/views/transaction_detail_view.dart';
import '../modules/main_screen/transaction_user/transaction_history/bindings/transaction_history_binding.dart';
import '../modules/main_screen/transaction_user/transaction_history/views/transaction_history_view.dart';
import '../modules/main_screen/wallet_user/bindings/wallet_user_binding.dart';
import '../modules/main_screen/wallet_user/views/recharge_bank.dart';
import '../modules/main_screen/wallet_user/views/recharge_qrcode_view.dart';
import '../modules/main_screen/wallet_user/views/vnpay_recharge.dart';
import '../modules/main_screen/wallet_user/views/wallet_user_view.dart';
import '../modules/minigame_drag_and_drop/bindings/minigame_drag_and_drop_binding.dart';
import '../modules/minigame_drag_and_drop/views/minigame_drag_and_drop_view.dart';
import '../modules/minigame_listening/bindings/minigame_listening_binding.dart';
import '../modules/minigame_listening/views/minigame_listening_view.dart';
import '../modules/minigame_matching_hidden/bindings/minigame_matching_hidden_binding.dart';
import '../modules/minigame_matching_hidden/views/minigame_matching_hidden_view.dart';
import '../modules/minigame_matching_show/bindings/minigame_matching_show_binding.dart';
import '../modules/minigame_matching_show/views/minigame_matching_show_view.dart';
import '../modules/minigame_reorder/bindings/minigame_reorder_binding.dart';
import '../modules/minigame_reorder/views/minigame_reorder_view.dart';
import '../modules/minigame_text_answer/bindings/minigame_text_answer_binding.dart';
import '../modules/minigame_text_answer/views/minigame_text_answer_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transitionDuration: Duration(microseconds: 5),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      transitionDuration: Duration(microseconds: 5),
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
      transitionDuration: Duration(microseconds: 5),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
      transitionDuration: Duration(microseconds: 5),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
      transitionDuration: Duration(microseconds: 5),
    ),
    GetPage(
      name: Routes.MAIN_EBOOK,
      page: () => MainEbookView(),
      binding: MainEbookBinding(),
      transitionDuration: Duration(microseconds: 5),
    ),
    GetPage(
      name: Routes.EBOOK,
      page: () => EbookView(),
      binding: EbookBinding(),
      transitionDuration: Duration(microseconds: 5),
    ),
    GetPage(
      name: Routes.HOME_COURSE,
      page: () => HomeCourseView(),
      binding: HomeCourseBinding(),
      transitionDuration: Duration(microseconds: 5),
    ),
    GetPage(
      name: Routes.RESULT_SEARCH,
      page: () => ResultSearchView(),
      binding: ResultSearchBinding(),
    ),
    GetPage(
      name: Routes.COURCE_DETAILS,
      page: () => CourceDetailsView(),
      binding: CourceDetailsBinding(),
    ),
    GetPage(
      name: Routes.CART_PRODUCT,
      page: () => CartProductView(),
      binding: CartProductBinding(),
    ),
    GetPage(
      name: Routes.CART_DISCOUNT_CODE,
      page: () => CartDiscountCodeView(),
      binding: CartDiscountCodeBinding(),
    ),
    GetPage(
      name: Routes.CART_PAYMENT_BANKING,
      page: () => CartPaymentBankingView(),
      binding: CartPaymentBankingBinding(),
    ),
    GetPage(
      name: Routes.MAIN_COURSE,
      page: () => MainCourseView(),
      binding: MainCourseBinding(),
    ),
    GetPage(
      name: Routes.COURSE_HOMEWORK_MINIGAME,
      page: () => CourseHomeworkMinigameView(),
      binding: CourseHomeworkMinigameBinding(),
    ),
    GetPage(
      name: Routes.EMPTY_VIEW,
      page: () => EmptyViewView(),
      binding: EmptyViewBinding(),
    ),
    GetPage(
      name: Routes.READ_EBOOK,
      page: () => ReadEbookView(),
      binding: ReadEbookBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_CATEGORY_PRODUCT,
      page: () => DetailCategoryProductView(),
      binding: DetailCategoryProductBinding(),
    ),
    GetPage(
      name: Routes.EXERCISE_INFO,
      page: () => ExerciseInfoView(),
      binding: ExerciseInfoBinding(),
    ),
    GetPage(
      name: Routes.EXERCISE_LIST,
      page: () => ExerciseListView(),
      binding: ExerciseListBinding(),
    ),
    GetPage(
      name: Routes.EXERCISE_STEP,
      page: () => ExerciseStepView(),
      binding: ExerciseStepBinding(),
    ),
    GetPage(
      name: Routes.EBOOK_DETAILS,
      page: () => EbookDetailsView(),
      binding: EbookDetailsBinding(),
    ),
    GetPage(
      name: Routes.MY_EBOOK,
      page: () => MyEbookView(),
      binding: MyEbookBinding(),
    ),
    GetPage(
      name: Routes.READ_BOOK,
      page: () => ReadBookView(),
      binding: ReadBookBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_CATEGORY_BOOK,
      page: () => DetailCategoryBookView(),
      binding: DetailCategoryBookBinding(),
    ),
    GetPage(
      name: Routes.MINIGAME_MATCHING_HIDDEN,
      page: () => MinigameMatchingHiddenView(),
      binding: MinigameMatchingHiddenBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_NEWS,
      page: () => DetailNewsView(),
      binding: DetailNewsBinding(),
    ),
    GetPage(
      name: Routes.MINIGAME_LISTENING,
      page: () => MinigameListeningView(),
      binding: MinigameListeningBinding(),
    ),
    GetPage(
      name: Routes.MINIGAME_TEXT_ANSWER,
      page: () => MinigameTextAnswerView(),
      binding: MinigameTextAnswerBinding(),
    ),
    GetPage(
      name: Routes.MINIGAME_REORDER,
      page: () => MinigameReorderView(),
      binding: MinigameReorderBinding(),
    ),
    GetPage(
      name: Routes.MINIGAME_MATCHING_SHOW,
      page: () => MinigameMatchingShowView(),
      binding: MinigameMatchingShowBinding(),
    ),
    GetPage(
      name: Routes.MINIGAME_DRAG_AND_DROP,
      page: () => MinigameDragAndDropView(),
      binding: MinigameDragAndDropBinding(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.SEARCH_EBOOK,
      page: () => SearchEbookView(),
      binding: SearchEbookBinding(),
    ),
    GetPage(
      name: Routes.RESULT_SEARCH_EBOOK,
      page: () => ResultSearchEbookView(),
      binding: ResultSearchEbookBinding(),
    ),
    GetPage(
      name: Routes.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: Routes.LIVE_CLASS_ONBOARD,
      page: () => LiveClassOnboardView(),
      binding: LiveClassOnboardBinding(),
    ),
    GetPage(
      name: Routes.LIVE_CLASS_HOME,
      page: () => LiveClassHomeView(),
      binding: LiveClassHomeBinding(),
    ),
    GetPage(
      name: Routes.LIVE_CLASS_REQUIRE_JOINCLASS,
      page: () => LiveClassRequireJoinclassView(),
      binding: LiveClassRequireJoinclassBinding(),
    ),
    GetPage(
      name: Routes.LIVE_CLASS_NOTIFICAITON,
      page: () => LiveClassNotificaitonView(),
      binding: LiveClassNotificaitonBinding(),
    ),
    GetPage(
      name: Routes.LIVE_CLASS_TEXTBOOK,
      page: () => LiveClassTextbookView(),
      binding: LiveClassTextbookBinding(),
    ),
    GetPage(
      name: Routes.LIVE_CLASS_MEMBERS,
      page: () => LiveClassMembersView(),
      binding: LiveClassMembersBinding(),
    ),
    GetPage(
      name: Routes.LIVE_CLASS_MESSAGE,
      page: () => LiveClassMessageView(),
      binding: LiveClassMessageBinding(),
    ),
    GetPage(
      name: Routes.LIVE_CLASS_LOGIN,
      page: () => LiveClassLoginView(),
      binding: LiveClassLoginBinding(),
    ),
    GetPage(
      name: Routes.LIVE_CLASS_HANDUP,
      page: () => LiveClassHandupView(),
      binding: LiveClassHandupBinding(),
    ),
    GetPage(
      name: Routes.EXERCISE_RESULT,
      page: () => ExerciseResultView(),
      binding: ExerciseResultBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_RATING,
      page: () => RatingDetail(),
      binding: EbookDetailsBinding(),
    ),
    GetPage(
      name: Routes.BOOK_PROGRESS,
      page: () => BookProgressView(),
      binding: BookProgressBinding(),
    ),
    GetPage(
      name: Routes.SETTING_PAGE,
      page: () => SettingAndSignOut(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.CONTACS,
      page: () => Contacs(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.RECHARGE_QRCODE,
      page: () => RechargeQrCode(),
      binding: WalletUserBinding(),
    ),
    GetPage(
      name: Routes.BANK_VIEW,
      page: () => BankView(),
      binding: WalletUserBinding(),
    ),
    GetPage(
      name: Routes.VNPAY,
      page: () => VnPay(),
      binding: WalletUserBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASS,
      page: () => ForgotPassView(),
      binding: ForgotPassBinding(),
    ),
    GetPage(
      name: Routes.LEARNING_PROGRESS,
      page: () => LearningProgressView(),
      binding: LearningProgressBinding(),
    ),
    GetPage(
      name: Routes.MAIN_EEXAM,
      page: () => MainEexamView(),
      binding: MainEexamBinding(),
    ),
    GetPage(
      name: Routes.EEXAM,
      page: () => EexamView(),
      binding: EexamBinding(),
    ),
    GetPage(
      name: Routes.WALLET_USER,
      page: () => WalletUserView(),
      binding: WalletUserBinding(),
    ),
    GetPage(
      name: Routes.POINT_HISTORY,
      page: () => PointHistoryView(),
      binding: PointHistoryBinding(),
    ),
    GetPage(
      name: Routes.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: Routes.EDIT_PROFILE,
      page: () => EditProfile(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: Routes.TRANSACTION_HISTORY,
      page: () => TransactionHistoryView(),
      binding: TransactionHistoryBinding(),
    ),
    GetPage(
      name: Routes.TRANSACTION_DETAIL,
      page: () => TransactionDetailView(),
      binding: TransactionDetailBinding(),
    ),
    GetPage(
      name: Routes.USER_COURSE_DETAIL,
      page: () => UserCourseDetailView(),
      binding: UserCourseDetailBinding(),
    ),
    GetPage(
      name: Routes.COURE_LEARN,
      page: () => CoureLearnView(),
      binding: CoureLearnBinding(),
    ),
    GetPage(
      name: Routes.COURE_TRAIL_PAGE,
      page: () => CoureTrailPageView(),
      binding: CoureTrailPageBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: Routes.SEARCH_EXAM,
      page: () => SearchExamView(),
      binding: SearchExamBinding(),
    ),
    GetPage(
      name: Routes.RESULT_SEARCH_EXAM,
      page: () => ResultSearchExamView(),
      binding: ResultSearchExamBinding(),
    ),
    GetPage(
      name: Routes.EXAM_DETAIL,
      page: () => ExamDetailView(),
      binding: ExamDetailBinding(),
    ),
    GetPage(
      name: Routes.DETAL_TEACHER,
      page: () => DetalTeacherView(),
      binding: DetalTeacherBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_COUOURSE_TEACHER,
      page: () => DetailCouourseTeacherView(),
      binding: DetailCouourseTeacherBinding(),
    ),
    GetPage(
      name: Routes.LEAARN_EXERCISE,
      page: () => LeaarnExerciseView(),
      binding: LeaarnExerciseBinding(),
    ),
    GetPage(
      name: Routes.LEAARN_EXERCISE_RESOULT,
      page: () => LeaarnExerciseResoultView(),
      binding: LeaarnExerciseResoultBinding(),
    ),
    GetPage(
      name: Routes.LEAARN_CERTIFICATE,
      page: () => LeaarnCertificateView(),
      binding: LeaarnCertificateBinding(),
    ),
    GetPage(
      name: Routes.PAYMENT_INAPP_WEBVIEW,
      page: () => PaymentInappWebviewView(),
      binding: PaymentInappWebviewBinding(),
    ),
  ];
}
