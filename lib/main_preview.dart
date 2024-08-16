import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'src/constants/constants.dart';
import 'src/exception/async_error_logger.dart';
import 'src/exception/error_logger.dart';
import 'src/routing/app_router.dart';

Future<void> main() async {
  final container = ProviderContainer(
    observers: [AsyncErrorLogger()],
  );

  final errorLogger = container.read(errorLoggerProvider);
  // * Register error handlers. For more info, see:
  // * https://docs.flutter.dev/testing/errors
  registerErrorHandlers(errorLogger);
  runApp(ProviderScope(child: DevicePreview(builder: (context) {
    return const MyApp();
  })));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: ThemeData(
        colorSchemeSeed: primaryColor,
        fontFamily: GoogleFonts.inter().fontFamily,
        scaffoldBackgroundColor: neutralColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: neutralColor,
          elevation: 0,
        ),
        textTheme: TextTheme(
          titleLarge: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
          titleMedium: const TextStyle(
            fontSize: 7,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
          titleSmall: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w300,
            color: textColor,
          ),
          bodyMedium: TextStyle(
            fontSize: 10,
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontWeight: FontWeight.w300,
            color: textColor,
          ),
          bodySmall: const TextStyle(
            fontSize: 7,
            fontWeight: FontWeight.w300,
            color: textColor,
          ),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      // useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}

void registerErrorHandlers(ErrorLogger errorLogger) {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    errorLogger.logError(details.exception, details.stack);
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    errorLogger.logError(error, stack);
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('An error occurred'),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
