import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plant_care_app/presentation/pages/core/app_widget.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://53ad33cff38b47c592e937d68954ee1c@o4508097865318400.ingest.us.sentry.io/4508097866301440';
        options.tracesSampleRate = 1.0;
        options.profilesSampleRate = 1.0;
      },
      appRunner: () => runApp(const SentryWidget(child: MyApp())),
    );

    FlutterError.onError = (FlutterErrorDetails details) async {
      FlutterError.presentError(details);
      await Sentry.captureException(details.exception,
          stackTrace: details.stack);
    };
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          throw Exception('Error occured');
        },
        child: const Text('Verify Sentry Setup'),
      )),
    );
  }
}
