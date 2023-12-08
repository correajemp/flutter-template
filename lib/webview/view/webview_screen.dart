import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:template/widgets/widgets.dart';

class WebViewScreen extends StatelessWidget {
  final String title;
  final String redirectUrl;

  const WebViewScreen({
    super.key,
    required this.title,
    required this.redirectUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewContent(
        title: title,
        redirectUrl: redirectUrl,
      ),
    );
  }
}

class WebViewContent extends StatefulWidget {
  final String title;
  final String redirectUrl;

  const WebViewContent({
    super.key,
    required this.title,
    required this.redirectUrl,
  });

  @override
  State<WebViewContent> createState() {
    return WebViewContentState();
  }
}

class WebViewContentState extends State<WebViewContent> {
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.redirectUrl));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    _webViewController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppHeaderContent(
            title: widget.title,
            onBack: () {
              context.pop();
            },
          ),
          Expanded(child: WebViewWidget(controller: _webViewController))
        ],
      ),
    );
  }
}
