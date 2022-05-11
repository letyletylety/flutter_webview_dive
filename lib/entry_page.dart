import 'package:flutter/material.dart';
import 'package:flutter_webview_dive/main.dart';

final pageLabel = {
  '/': 'Entry',
  '/home': 'Home',
  '/javascript': 'Javascript',
  '/naver': 'Naver',
};

class EntryPage extends StatelessWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
            children: appRoute.keys
                .map((value) => PortalButton(
                      routeName: value,
                      label: pageLabel[value] ?? "no label",
                    ))
                .toList()

            // const [
            //   PortalButton(
            //     label: 'HomePage',
            //     routeName: '/home',
            //   ),
            //   PortalButton(
            //     label: 'Javascript Page',
            //     routeName: '/javascript',
            //   ),
            // ],
            ),
      ),
    );
  }
}

class PortalButton extends StatelessWidget {
  const PortalButton({
    Key? key,
    required this.label,
    required this.routeName,
  }) : super(key: key);

  final String label;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Text(label),
    );
  }
}
