import 'package:flutter/material.dart';
import 'package:komiwall/components/general/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewHandler extends StatefulWidget {
  const WebViewHandler({
    super.key,
    required this.url,
  });
  final String url;

  @override
  State<WebViewHandler> createState() => _WebViewHandlerState();
}

class _WebViewHandlerState extends State<WebViewHandler> {
  late final WebViewController _controller;
  late final WebViewCookieManager _cookie = WebViewCookieManager();

  bool _loading = true;

  @override
  void initState() {
    _controller = WebViewController.fromPlatformCreationParams(
        const PlatformWebViewControllerCreationParams())
      ..setNavigationDelegate(NavigationDelegate(
          onPageStarted: (url) {},
          onNavigationRequest: (request) {
            launchUrl(Uri.parse(request.url),
                mode: LaunchMode.externalApplication);

            return NavigationDecision.navigate;
          },
          onPageFinished: (_) {
            if (mounted) {
              setState(() {
                _loading = false;
              });
              _controller.clearCache();
              _cookie.clearCookies();
            }
          }))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _loading == true
        ? const MyShimmer()
        : WebViewWidget(
            controller: _controller,
          );
  }
}
