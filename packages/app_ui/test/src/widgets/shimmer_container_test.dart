import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() {
  group('ShimmerContainer', () {
    testWidgets('renders a shimmer container', (tester) async {
      await tester.pumpApp(const ShimmerContainer(width: 100, height: 100));
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(ShimmerContainer), findsOneWidget);
    });
  });
}
