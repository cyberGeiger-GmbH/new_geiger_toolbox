import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_controller.dart';


class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          InitScanWidget(),
        ],
      ),
    );
  }
}

class InitScanWidget extends ConsumerWidget {
  const InitScanWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scanButtonControllerProvider);
    final newsFeedState = ref.watch(watchNewsFeedsProvider);

    return AppButton.scan(
        label: state.isLoading || newsFeedState.isLoading ? "scanning" : "Scann",
        context: context,
        onPressed: () async{
          await ref.read(scanButtonControllerProvider.notifier).scan();
        });
  }
}
