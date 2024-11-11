import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/utils/providers/hive_data_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_start_up.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartUp(Ref ref) async {
  ref.onDispose(() {
    //ensure we invalidate all the providers we depend on
    ref.invalidate(initHiveProvider);
  });
  //all asynchronous app initialization c
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  await ref.watch(initHiveProvider.future);
}
