import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AbrirEnlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String url = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        child: WebView(
          initialUrl: url,
        ),
      ),
    );
  }
}
