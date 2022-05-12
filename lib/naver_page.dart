import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NaverPage extends StatefulWidget {
  const NaverPage({Key? key}) : super(key: key);

  @override
  State<NaverPage> createState() => _NaverPageState();
}

class _NaverPageState extends State<NaverPage> {
  late WebViewController wvController;

  bool tryLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Naver'),
      ),
      body: WebView(
        initialUrl: 'https://nid.naver.com/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (wvController) {
          this.wvController = wvController;
        },
        onPageFinished: (page) async {
          log('$page is loaded');

          if (tryLogin) {
            log('로그인에 실패 했습니다.');
          } else {
            setState(() {tryLogin = true;});

            var userId = "id";
            var userPw = "password";

            wvController
                .runJavascript('document.getElementById("id").value="$userId"');
            wvController
                .runJavascript('document.getElementById("pw").value="$userPw"');

            await Future.delayed(const Duration(milliseconds: 500));

            await wvController.runJavascript('document.forms[0].submit()');
          }
        },
      ),
    );
  }
}
