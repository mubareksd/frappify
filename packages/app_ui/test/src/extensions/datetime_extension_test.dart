import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateTimeExtension', () {
    test('toDDMMYY formats correctly', () {
      final date = DateTime(2000, 12, 31);
      expect(date.toDDMMYY(), '31/12/2000');
    });
  });
}
