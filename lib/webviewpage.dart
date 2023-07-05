import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({Key? key}) : super(key: key);

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  final Completer<WebViewController> _controllerCompleter =
  Completer<WebViewController>();
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Stack(
        children: [
          WebView(
            initialUrl: 'https://mobile.tamspetshop.store/',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controllerCompleter.complete(webViewController);
            },
            onPageStarted: (String url) {
              setState(() {
                _isLoading = true;
              });
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              setState(() {
                _isLoading = false;
              });
              print('Page finished loading: $url');
            },
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                print('Blocking navigation to $request');
                return NavigationDecision.prevent;
              }
              print('Allowing navigation to $request');
              return NavigationDecision.navigate;
            },
            gestureNavigationEnabled: true,
            geolocationEnabled: false, // support geolocation or not
          ),
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
