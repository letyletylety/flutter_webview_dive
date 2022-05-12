import 'package:flutter/material.dart';
import 'package:flutter_webview_dive/home_page.dart';
import 'package:flutter_webview_dive/local_page.dart';
import 'package:flutter_webview_dive/naver_page.dart';

import 'entry_page.dart';
import 'js_page.dart';

void main() {
  runApp(const App());
}

final appRoute = {
  '/': (context) => const EntryPage(),
  '/home': (context) => const HomePage(),
  '/javascript': (context) => const JSPage(),
  '/naver': (context) => const JSPage(),
  '/local': (context) => const LocalWebViewPage(),
};

final pageLabel = {
  '/': 'Entry',
  '/home': 'Home',
  '/javascript': 'Javascript',
  '/naver': 'Naver',
  '/local': 'Local',
};

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      // routes: appRoute,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home':
            return FPageBuilder(dest: const HomePage());
          case '/javascript':
            return FPageBuilder(dest: const JSPage());
          case '/naver':
            return FPageBuilder(dest: const NaverPage());
          case '/local':
            return FPageBuilder(dest: const LocalWebViewPage());
          default:
            return FPageBuilder(dest: const EntryPage());
        }
      },
    );
  }
}

class FPageBuilder extends PageRouteBuilder {
  FPageBuilder({
    required Widget dest,
  }) : super(
          pageBuilder: (_, __, ___) => dest,
          transitionsBuilder: (_, a, __, child) =>
              FadeTransition(opacity: a, child: child),
        );
}
