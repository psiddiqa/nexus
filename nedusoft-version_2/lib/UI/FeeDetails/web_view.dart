import 'package:flutter/material.dart';
import 'package:nedusoft/Utils/Colors.dart';
import 'package:nedusoft/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/service_locator/service_locator.dart';
import '../../core/widget/common_app_bar.dart';

class WebviewScreen extends StatefulWidget {
  String url;
  WebviewScreen({required this.url});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late final WebViewController controller;
  NavigationService _navigationService = locator<NavigationService>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _navigationService.back();
        _navigationService.replaceWithStudentFeesDetail();
        return true;
      },
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.sizeOf(context).width, 60),
            child: CommonAppBar("Payment Page", actions: [
              Padding(
                padding: const EdgeInsets.only(top: 24, right: 12),
                child: InkWell(
                  onTap: () {
                    _navigationService.back();
                    _navigationService.replaceWithStudentFeesDetail();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: WhiteColor, fontFamily: 'sfSemibold'),
                  ),
                ),
              ),
            ])),
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}
