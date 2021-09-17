import 'package:flutter/material.dart';
import 'package:scorm_test/utils/scorm_list.dart';

import 'web_view_page.dart';

class WebViewListPage extends StatelessWidget {
  const WebViewListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final height = size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('List WebView'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: height * 0.3),
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _loadWebViewPage(
                context,
                url: ScormList.simpleGolf,
              ),
              child: const Text('Simple Golf'),
            ),
            ElevatedButton(
              onPressed: () => _loadWebViewPage(
                context,
                url: ScormList.golfWithAlert,
              ),
              child: const Text('Golf with alert'),
            ),
            ElevatedButton(
              onPressed: () => _loadWebViewPage(
                context,
                url: ScormList.bv,
              ),
              child: const Text('BV'),
            ),
            ElevatedButton(
              onPressed: () => _loadWebViewPage(
                context,
                url: ScormList.bvOpenedOnChrome,
              ),
              child: const Text('BV opened on Chrome'),
            ),
          ],
        ),
      ),
    );
  }

  void _loadWebViewPage(BuildContext context, {required String url}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => WebViewPage(url: url),
      ),
    );
  }
}
