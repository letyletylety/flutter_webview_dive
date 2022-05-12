import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class JSPage extends StatefulWidget {
  const JSPage({Key? key}) : super(key: key);

  @override
  State<JSPage> createState() => _JSPageState();
}

class _JSPageState extends State<JSPage> {
  late WebViewController wvController;

  bool htmlLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('javascript')),
      body: WebView(
        initialUrl: 'https://google.com',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (wvController) {
          this.wvController = wvController;
        },
        onPageStarted: (page) {
          setState(() {
            htmlLoading = true;
          });
        },
        onPageFinished: (page) {
          log('$page loaded');

          setState(() {
            htmlLoading = false;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await wvController.runJavascript(
              "document.getElementsByTagName('form')[0].style.display = 'none'");

          Future.delayed(
              const Duration(seconds: 1),
              () => wvController.runJavascript(
                  "document.getElementsByTagName('form')[0].style.display = 'block'"));

          // Future<String> jsResult =
          //     wvController.runJavascriptReturningResult("1+1");
          // jsResult.then((value) => log(value));

          // wvController.

          // wvController.runJavascript(
          //     "document.getElementById('MM_SEARCH_FAKE')[0].style.display = 'none'");
        },
      ),
    );
  }
}
