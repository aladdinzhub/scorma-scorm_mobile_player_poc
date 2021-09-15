//
//  WebViewController.swift
//  ScormTest
//
//  Created by Will Germano on 09/09/21.
//
import WebKit
import UIKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var urlString: String?
    
    convenience init() {
        self.init(urlString: nil)
    }
    
    init(urlString: String?) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let urlString = self.urlString {
            self.loadWebView(urlString)
        }
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        let javaScript = """
            var meta = document.createElement('meta');
                        meta.setAttribute('name', 'viewport');
                        meta.setAttribute('content', 'width=device-width');
                        document.getElementsByTagName('head')[0].appendChild(meta);
            """
        webView.evaluateJavaScript(javaScript)
    }
    
    private func loadWebView(_ urlString: String) {
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
    }
}

