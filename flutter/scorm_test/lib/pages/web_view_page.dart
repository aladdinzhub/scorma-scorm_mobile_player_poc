import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    required this.url,
    Key? key,
  }) : super(key: key);

  final String url;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool isLoading = true;

  late final WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WebView')),
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                this.webViewController = webViewController;
              },
              onWebResourceError: (error) {
                debugPrint('onWebResourceError: ${error.errorCode}');
              },
              onProgress: (value) {
                debugPrint('progress: $value');
              },
              onPageStarted: (_) {
                _updateLoading(true);
              },
              onPageFinished: (_) {
                _fixResponsiveLayout();
                _updateLoading(false);
              },
            ),
            if (isLoading) ...[
              const Center(
                child: CircularProgressIndicator(),
              ),
            ]
          ],
        ),
      ),
    );
  }

  void _updateLoading(bool isLoading) {
    setState(() {
      this.isLoading = isLoading;
    });
  }

  void _fixResponsiveLayout() {
    const javaScript = '''
      function fixResponsive() {
        var meta = document.createElement('meta');
        meta.setAttribute('name', 'viewport');
        meta.setAttribute('content', 'width=device-width');
        document.getElementsByTagName('head')[0].appendChild(meta);
      }
      fixResponsive();
    ''';
    webViewController.evaluateJavascript(javaScript);
  }
}
