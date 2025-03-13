import 'dart:async';

import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';

import 'package:geiger_toolbox/src/monitoring/analytics_facade.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../applications/news_feed_service.dart';
part 'scan_button_controller.g.dart';

@riverpod
class ScanButtonController extends _$ScanButtonController {
  Logger get _log => ref.read(logHandlerProvider("ScanButtonController"));

  @override
  FutureOr<void> build() async {
    return;
    //nothing to do
  }

  Future<void> scan() async {
    _log.i("scanButton pressed");
    //analytics
    unawaited(_trackScanning());

    state = const AsyncLoading();

    state = await AsyncValue.guard(() => ref.read(newsFeedServiceProvider).cacheNews());

    //for testing purpose
    // state = await AsyncValue.guard(() => Future.delayed(const Duration(seconds: 3)));

    _log.i("scanning completed ");
  }

  Future<void> _trackScanning() async {
    final compRepo = ref.read(companyProfileRepositoryProvider);
    final compProfile = await compRepo.fetchCompany();

    if (compProfile != null) {
      ref.read(analyticsFacadeProvider).trackScanWithProfile();
    } else {
      ref.read(analyticsFacadeProvider).trackScanWithoutProfile();
    }
  }
}
