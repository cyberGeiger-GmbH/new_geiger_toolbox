import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/monitoring/collect_usage_statistics_store.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CollectUsageStatisticsListTile(),
      ],
    );
  }
}

class CollectUsageStatisticsListTile extends ConsumerWidget {
  const CollectUsageStatisticsListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(collectUsageStatisticsStoreProvider);
    return ListTile(
      title: Text('Collect anonymous usage statistics'.hardcoded),
      trailing: Semantics(
        label: 'Anonymous usage statistics toggle'.hardcoded,
        value: state ? 'Enabled'.hardcoded : 'Disabled'.hardcoded,
        child: Switch.adaptive(
          value: state,
          onChanged: (value) {
            ref
                .read(collectUsageStatisticsStoreProvider.notifier)
                .setCollectUsageStatistics(value);
          },
        ),
      ),
    );
  }
}
