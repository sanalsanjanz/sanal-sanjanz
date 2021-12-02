import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Ser extends StatelessWidget {
  const Ser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'wa.me/+8606044696',
      ),
    ));
  }
}
