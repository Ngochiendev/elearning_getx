import 'package:elearning/app/services/ebook_service.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';

class ReadEbookController extends GetxController {
  //TODO: Implement EbookController
  final _counter = 0.obs;
  final indexPage = 0.obs;

  var pages = 0.obs;
  var path = "".obs;
  final count = 0.obs;
  var text = "".obs;
  // PDFViewController? pdfViewController;

  @override
  void onInit() async {
    super.onInit();
    text.value = '${indexPage + 1} of $pages';
    // final pdf = await PDFApi.loadNetwork(
    //     "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf");
    // path.value = pdf.path;
    update();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
}
