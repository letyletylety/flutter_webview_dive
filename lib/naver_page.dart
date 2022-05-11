import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NaverPage extends StatefulWidget {
  const NaverPage({Key? key}) : super(key: key);

  @override
  State<NaverPage> createState() => _NaverPageState();
}

class _NaverPageState extends State<NaverPage> {
  late WebViewController wvController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://google.com',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (wvController) {
          this.wvController = wvController;
        },
      ),
    );
  }
}
