import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/utils/package_info.dart';

class AppVersionWidget extends ConsumerWidget {
  const AppVersionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appVersion = ref.watch(packageInfoProvider);
    final screenHeight = MediaQuery.sizeOf(context).height;

    return SizedBox(
      height: screenHeight * 0.2,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: theme.textTheme.bodySmall,
          children: [
            TextSpan(
              text: "${appVersion.requireValue.appName}\n".hardcoded,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            TextSpan(text: "Version: "),
            TextSpan(text: "${appVersion.requireValue.version} (${appVersion.requireValue.buildNumber})"),
          ],
        ),
      ),
    );
  }
}
