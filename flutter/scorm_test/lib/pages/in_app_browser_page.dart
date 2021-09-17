import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppBrowserPage extends StatefulWidget {
  const InAppBrowserPage({
    required this.url,
    Key? key,
  }) : super(key: key);

  final String url;

  @override
  State<InAppBrowserPage> createState() => _InAppBroserPawgeState();
}

class _InAppBroserPawgeState extends State<InAppBrowserPage> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('In App Browser'),
      ),
      body: Stack(
        children: <Widget>[
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(widget.url),
            ),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                javaScriptEnabled: true,
                useShouldOverrideUrlLoading: true,
                javaScriptCanOpenWindowsAutomatically: true,
                cacheEnabled: false,
                useOnLoadResource: true,
              ),
            ),
            onLoadStart: (_, __) {
              _updateLoading(true);
            },
            onLoadStop: (controller, __) {
              _fixResponsiveLayout(controller);
              _updateLoading(false);
            },
            onLoadHttpError: (controller, url, code, message) {
              debugPrint('$url $code $message');
            },
            onLoadError: (controller, url, errorCode, errorDescription) {
              debugPrint('$url $errorCode $errorDescription');
            },
          ),
          if (isLoading) ...[
            const Center(
              child: CircularProgressIndicator(),
            ),
          ]
        ],
      ),
    );
  }

  void _updateLoading(bool isLoading) {
    setState(() {
      this.isLoading = isLoading;
    });
  }

  void _fixResponsiveLayout(InAppWebViewController controller) {
    const javaScript = '''
      var meta = document.createElement('meta');
                  meta.setAttribute('name', 'viewport');
                  meta.setAttribute('content', 'width=device-width');
                  document.getElementsByTagName('head')[0].appendChild(meta);
      ''';
    controller.evaluateJavascript(source: javaScript);
  }
}
