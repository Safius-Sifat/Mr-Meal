import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../common_widgets/overlay_loader.dart';
import '../../../routing/app_router.dart';
import '../../../utils/toastification.dart';
import '../../cart/application/cart_service.dart';
import '../data/payment_repository.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  const PaymentScreen({super.key, required this.paymentUrl});
  final String paymentUrl;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  late final WebViewController _controller;
  String currentUrl = 'Payment';
  Future<void> check(String url) async {
    try {
      showOverlayLoader(context);
      final success = await ref
          .read(paymentRepositoryProvider)
          .fetchPaymentStatus(url: url);

      context.pop();
      if (success) {
        ref.invalidate(cartProvider);
        context.goNamed(AppRoute.paymentSuccess.name);
      } else {
        context.goNamed(AppRoute.paymentFailure.name);
      }
    } catch (e) {
      context.pop();
      context.pop();
      errorToast(
          ctx: context, title: 'Payment Failed', description: e.toString());
    }
  }

  int loadingPercentage = 0;
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..loadRequest(Uri.parse(widget.paymentUrl))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onNavigationRequest: (request) {
          if (request.url.contains('meals.dotprogrammers.com')) {
            check(request.url);
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) async {
          setState(() {
            loadingPercentage = 100;
          });
        },
        onUrlChange: (change) async {
          setState(() {
            currentUrl = change.url ?? 'Payment';
          });
        },
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentUrl),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
        ],
      ),
    );
  }
}
