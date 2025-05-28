import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LocaleExtension', () {
    test('fullName formats correctly', () {
      const locale = Locale('en');
      expect(locale.fullName(), {'primary': 'English', 'secondary': 'English'});
    });
  });
}
