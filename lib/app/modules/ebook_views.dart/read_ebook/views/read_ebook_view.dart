import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:get/get.dart';

import '../controllers/read_ebook_controller.dart';

class ReadEbookView extends GetView<ReadEbookController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("Ebook"),
          actions: controller.pages >= 2
              ? [
                  Center(child: Text(controller.text.value)),
                  IconButton(
                    icon: Icon(Icons.chevron_left, size: 32),
                    onPressed: () {
                      final page =
                          controller.indexPage.value == 0 ? controller.pages.value : controller.indexPage.value - 1;
                      // controller.pdfViewController?.setPage(page);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.chevron_right, size: 32),
                    onPressed: () {
                      final page =
                          controller.indexPage.value == controller.pages.value - 1 ? 0 : controller.indexPage.value + 1;
                      // controller.pdfViewController?.setPage(page);
                    },
                  ),
                ]
              : null,
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child:
              // controller.path.value.isNotEmpty
              //     ? PDFView(
              //         filePath: controller.path.value,
              //         // autoSpacing: false,
              //         // swipeHorizontal: true,
              //         // pageSnap: false,
              //         // pageFling: false,
              //         onRender: (pages) => controller.pages.value = pages ?? 0,
              //         onViewCreated: (pdf) => controller.pdfViewController = pdf,
              //         onPageChanged: (indexPage, _) => controller.indexPage.value = indexPage ?? 0)
              //     :
              Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
