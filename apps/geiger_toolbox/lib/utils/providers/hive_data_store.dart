import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'hive_data_store.g.dart';

class HiveDataStore {
  Future<void> initHive() async {
    // await Future.delayed(const Duration(seconds: 10));
    await Hive.initFlutter();
    //todo: register all adapters
    // Hive
    //   ..init(Directory.current.path)
    //   ..registerAdapters();

    //todo: open boxes
  }
}

@Riverpod(keepAlive: true)
HiveDataStore hiveDataStore(Ref ref) => HiveDataStore();

@Riverpod(keepAlive: true)
Future<void> initHive(Ref ref) async {
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final HiveDataStore hiveDataStore = ref.watch(hiveDataStoreProvider);

  return hiveDataStore.initHive();
}
