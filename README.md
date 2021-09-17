# SCORM player PoC

A simple **SCORM** content player to mobile devices. There's no open-source SDK to display the content, so we choose to display the content using **WebViews**, and the PoCs is to show us all the feedbacks and possible issues using web view in these technologies.

All the PoCs have the same concept: An app with small navigation displaying the possible options to show the SCORM content. (All the possible ways to display web content).

## Tecnologies

We used **two** categories (Cross-platform and Native) and **three** technologies (iOS, Android, and Flutter) to give us a better notion and help us define our future.

-- 

### Android

In Native Android, there're three ways to display "web content" in an app.

#### WebView

It is the "default" way to display any web content. The developer has major control over the content, so we can create **javascript bridges** and manipulate **all** the content from the native app to the web and the other way.  But with all this "power," bring us possible security gaps.

Our SCORM links don't have the `scale meta-tag`, so the content doesn't resize well on mobile devices. Using the Web View, we can inject this tag to improve the content readability. 

This option is the only one capable of integrating the native layout, so the user doesn't notice the app context changes.

#### CCT (Chrome Custom Tab)

It's the best option in the security case. It uses a tab literally from the browser, which could be or not a **Chrome** tab. 

It's impossible to inject any data (CSS, JS) from native code to the web, and the content is shown in another context (Navigating to another "page"), clearly showing the user that content is not "native content."

### iOS

How we saw above in the Android version, the iOS native has two ways to display web content in the Android version.

#### WKWebView

It's a homolog to the **Android's WebView**, give us the same "power" and control. 

#### SFSafariViewController

It's a homolog to the **Android's Custom Tab**, we cannot inject any data, and it is impossible to show the data in the same context of the "native" app.
 
### Flutter

Flutter doesn't have any way "natively" to show web content, so we choose the better libs to create this Prove of Concept.

#### FlutterWebView

It's the default lib to display web content created by the Flutter team. It uses the **Android's WebView** and the **WKWebView** under the hood. 

Because of the dart's abstraction, we encounter some problems reproducing the same PoC from the native, particularly the injection of the Javascript to add the `scale meta-tag`.

#### FlutterInAppBrowser

It's a lib created by the community and supports all the mobile  technologies:

* Android's WebView 
* Custom Tab
* WKWebView 
* SFSafariViewController

In the end, we had the same result of the **FlutterWebView** using the same options. 
The difficulties to add the `scale meta-tag` was found here too.
