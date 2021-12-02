import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Instagram extends StatelessWidget {
  const Instagram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: ' www.instagram.com/door_to_her_bliss_m/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
