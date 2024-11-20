import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/home_screen_controller.dart';

import 'widgets/news_feeds.dart';

//home screen
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      homeScreenControllerProvider,
      (_, nextState) => nextState.showAlertDialogOnError(context: context),
    );
    final state = ref.watch(homeScreenControllerProvider);

    final appColors = Theme.of(context).appColors.appColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Spacing.gapH32,
        AppButton.scan(
          label: state.isLoading ? "scanning.." : 'Scan',
          context: context,
          onPressed: state.isLoading
              ? null
              : () {
                  ref.read(homeScreenControllerProvider.notifier).scan();
                },
        ),
        Spacing.gapH16,
        const CarouselWithIndicatorDemo(),
        Spacing.gapH16,
        AppAssetsIcons.filledTonal(
          context: context,
        ),
        Spacing.gapH16,
        Padding(
          padding: const EdgeInsets.all(Spacing.p12),
          child: EmptyContent(
            message:
                "Press the Geiger Scan Botton to get your protection score",
            color: appColors.defaultColor,
          ),
        )
      ],
    );
  }
}
