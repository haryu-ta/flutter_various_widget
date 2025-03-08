import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatelessWidget {
  const WebviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..loadRequest(Uri.parse(
          'https://twiman.net/search/illust?q=%E3%81%A1%E3%81%84%E3%81%8B%E3%82%8F&m=tweet&o=2'))
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (String url) {
          print('page finished: $url');
        },
      ));
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                controller.goBack();
              }),
          actions: [
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: WebViewWidget(controller: controller));
  }
}
