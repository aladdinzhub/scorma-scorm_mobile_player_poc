import 'package:flutter/material.dart';

import 'in_app_list_page.dart';
import 'web_view_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const InAppBrowserListPage(),
                  ),
                );
              },
              child: const Text('Go to InAppBrowser'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const WebViewListPage(),
                  ),
                );
              },
              child: const Text('Go to WebView'),
            )
          ],
        ),
      ),
    );
  }
}
