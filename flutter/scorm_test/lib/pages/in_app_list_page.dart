import 'package:flutter/material.dart';
import 'package:scorm_test/utils/scorm_list.dart';

import 'in_app_browser_page.dart';

class InAppBrowserListPage extends StatelessWidget {
  const InAppBrowserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final height = size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('List InAppBrowser'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: height * 0.3),
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _loadInAppBrowserPage(
                context,
                url: ScormList.simpleGolf,
              ),
              child: const Text('Simple Golf'),
            ),
            ElevatedButton(
              onPressed: () => _loadInAppBrowserPage(
                context,
                url: ScormList.golfWithAlert,
              ),
              child: const Text('Golf with alert'),
            ),
            ElevatedButton(
              onPressed: () => _loadInAppBrowserPage(
                context,
                url: ScormList.bv,
              ),
              child: const Text('BV'),
            ),
            ElevatedButton(
              onPressed: () => _loadInAppBrowserPage(
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

  void _loadInAppBrowserPage(BuildContext context, {required String url}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => InAppBrowserPage(url: url),
      ),
    );
  }
}
