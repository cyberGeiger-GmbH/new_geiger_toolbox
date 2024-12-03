import 'dart:async';

import 'package:leak_tracker_flutter_testing/leak_tracker_flutter_testing.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  LeakTesting.enabled;
  LeakTesting.settings =
      LeakTesting.settings.withIgnored(createdByTestHelpers: true);
  await testMain();
}
