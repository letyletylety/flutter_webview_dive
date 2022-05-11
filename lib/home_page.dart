import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebViewController wvController;

  int index = 0;

  List<String> urls = ['https://flutter.dev/', 'https://google.com/'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('webview'),
      ),
      body: WebView(
        initialUrl: urls[index],
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (wvController) {
          this.wvController = wvController;
        },
        onPageStarted: (String page) {
          log('새로운 페이지 : $page');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final whereAmI = await wvController.currentUrl();

          log('현재 페이지 : $whereAmI');

          setState(() {
            index = (index + 1) % urls.length;
            wvController.loadUrl(urls[index]);
          });
        },
      ),
    );
  }
}
