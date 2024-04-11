import 'dart:io';

import 'package:elearning/app/services/bank_service.dart';
import 'package:elearning/app/services/cart_service.dart';
import 'package:elearning/app/services/live_class_service.dart';
import 'package:elearning/app/services/search_service.dart';
import 'package:elearning/app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as i;
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app/config/constant.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

void main() async {
  Paint.enableDithering = true;
  await configApp();
  await SentryFlutter.init(
    (options) {
      options.dsn = SENTRY_DNS;
      options.reportSilentFlutterErrors = true;
    },
    appRunner: () => runApp(
      GetMaterialApp(
        title: 'E-Learning',
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData(
          textTheme: GoogleFonts.lexendDecaTextTheme(),
          backgroundColor: Colors.white,
          primaryColor: Colors.white,
          dividerColor: Colors.transparent,
          shadowColor: Colors.transparent,
          appBarTheme: AppBarTheme(elevation: 0),
        ),
        defaultTransition: Transition.native,
        translationsKeys: AppTranslation.translations,
        locale: Locale('vi', 'VN'),
        fallbackLocale: Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        navigatorObservers: [
          // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
        ],
      ),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> configApp() async {
  HttpOverrides.global = new MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await i.AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

    var swAvailable = await i.AndroidWebViewFeature.isFeatureSupported(
        i.AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
    var swInterceptAvailable = await i.AndroidWebViewFeature.isFeatureSupported(
        i.AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

    if (swAvailable && swInterceptAvailable) {
      i.AndroidServiceWorkerController serviceWorkerController =
          i.AndroidServiceWorkerController.instance();

      serviceWorkerController.serviceWorkerClient =
          i.AndroidServiceWorkerClient(
        shouldInterceptRequest: (request) async {
          print(request);
          return null;
        },
      );
    }
  }
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  SystemUiOverlayStyle(
    //  statusBarColor: Colors.red,

    // Status bar brightness (optional)
    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    statusBarBrightness: Brightness.light, //
  );
  await GetStorage.init();
  // await Firebase.initializeApp();

  await dotenv.load(fileName: '.env.dev');
  Get.put(SearchService());
  Get.put(CartService());
  Get.put(LiveClassService());
  Get.put(BankService());
  Get.put(UserService());
}
