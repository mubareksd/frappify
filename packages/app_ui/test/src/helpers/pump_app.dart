import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

extension AppTester on WidgetTester {
  Future<void> pumpApp(
    Widget widgetUnderTest, {
    ShadThemeData? theme,
    MockNavigator? navigator,
  }) async {
    await pumpWidget(
      ShadApp(
        theme: theme,
        home: navigator == null
            ? Scaffold(body: widgetUnderTest)
            : MockNavigatorProvider(
                navigator: navigator,
                child: Scaffold(body: widgetUnderTest),
              ),
      ),
    );
    await pump();
  }
}
