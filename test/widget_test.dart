import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('PortfolioApp renders successfully', (tester) async {
    await tester.pumpWidget(const PortfolioApp());
    expect(find.byType(PortfolioApp), findsOneWidget);
  });

  testWidgets('PortfolioApp renders on various mobile viewports without overflow',
      (tester) async {
    final viewports = [
      const Size(320, 568),
      const Size(375, 812),
      const Size(390, 844),
      const Size(414, 896),
    ];

    for (final size in viewports) {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(const PortfolioApp());
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull,
          reason: 'Failed on viewport ${size.width}x${size.height}');
    }

    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
}
