import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LocalWebViewPage extends StatefulWidget {
  const LocalWebViewPage({Key? key}) : super(key: key);

  @override
  State<LocalWebViewPage> createState() => _LocalWebViewPageState();
}

class _LocalWebViewPageState extends State<LocalWebViewPage> {
  late WebViewController wvController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('local')),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (wvController) {
          this.wvController = wvController;

          // wvController.loadHtmlString(html);
        },
      ),
    );
  }
}
