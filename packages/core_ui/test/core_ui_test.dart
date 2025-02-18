import 'package:core_ui/helpers/design_system_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens("Design system", (WidgetTester tester) async {
    final builder =
        GoldenBuilder.column()
          ..addScenario("Colors", DesignSystemHelper.getColors())
          ..addScenario("Text", DesignSystemHelper.getTexts())
          ..addScenario("Buttons", DesignSystemHelper.getAppButtons());

    //await loadRobotoFont();
    await tester.pumpWidgetBuilder(builder.build(), surfaceSize: const Size(1000, 1000));
    await screenMatchesGolden(tester, "design_system");
  }, tags: ['golden']);
}

// Future<void> loadRobotoFont() async {
//   final font =
//       rootBundle.load('assets/fonts/TT-Norms-Fonts/TTNorms-Regular.otf');

//   final fontLoader = FontLoader('Roboto')..addFont(font);
//   await fontLoader.load();
// }
