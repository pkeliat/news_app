import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/directory_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDetail extends StatelessWidget {
  final dc = Get.find<DirectoryController>();
  var progLoading = 0.obs;
  var isLoading = true.obs;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(dc.detailTitle.value)),
        ),
        body: SafeArea(
          child: Stack(children: [
            WebView(
                initialUrl: dc.detailUrl.value,
                onPageStarted: (_) {
                  isLoading.value = true;
                },
                onPageFinished: (_) {
                  isLoading.value = false;
                }),
            Obx(() => isLoading.value == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container())
          ]),
        ));
  }
}
