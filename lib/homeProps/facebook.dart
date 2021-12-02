import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FaceBook extends StatelessWidget {
  const FaceBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: WebView(
        initialUrl: 'www.facebook.com/SanjanZzz',
        javascriptMode: JavascriptMode.unrestricted,
      )),
    );
  }
}
