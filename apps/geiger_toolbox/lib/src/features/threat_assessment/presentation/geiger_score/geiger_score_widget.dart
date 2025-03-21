import 'package:core_ui/core_ui.dart';
import 'package:core_ui/organisms/news_content.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/common_widgets/geiger_card.dart';
import 'package:geiger_toolbox/src/common_widgets/loading_animation_widget.dart';
import 'package:geiger_toolbox/src/common_widgets/snack_bar.dart';
import 'package:geiger_toolbox/src/extensions/score_color.dart';
import 'package:geiger_toolbox/src/extensions/string_extension.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/geiger_score_service.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/geiger_score/geiger_score_controller.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_controller.dart';

class GeigerScoreWidget extends ConsumerWidget {
  const GeigerScoreWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoreValue = ref.watch(watchGeigerScoreProvider);
    final state = ref.watch(geigerScoreControllerProvider);

    final theme = Theme.of(context);

    //listen to the scan button controller provider for scan complete
    ref.listen(scanButtonControllerProvider, (_, newV) {
      ref.read(geigerScoreControllerProvider.notifier).onScanComplete(scanPressState: newV);
    });

    //listen to the geiger score controller provider for error
    ref.listen(geigerScoreControllerProvider, (_, newV) {
      ref.read(scoreErrorProvider.notifier).onCalculateError(calculateState: newV);
    });

    //show error snackbar
    ref.listen(scoreErrorProvider, (_, newV) {
      if (newV) {
        showSnackBar(
          context: context,
          content: "Error still persist please, contact the support team",
          backgroundColor: theme.colorScheme.errorContainer,
          duration: 6,
        );
      }
    });

    final errorState = ref.watch(scoreErrorProvider);

    return errorState
        ? GeigerCard(
          child: ErrorMessage(
            message: "Failed to calculate score",
            onRetry: () async {
              await ref.read(geigerScoreControllerProvider.notifier).calculateGeigerScore();
            },
          ),
        )
        : ShowScore(
          isLoading: state.isLoading,
          builder:
              (_) => AsyncValueWidget(
                value: scoreValue,
                data:
                    (data) =>
                        data == null
                            ? const SizedBox.shrink()
                            : _ScoreWithInfo(
                              score: "${data.geigerScore}",
                              key: key,
                              //Todo: change font color base the score range
                              showinfo: () {
                                showWoltAlertDialog(
                                  context,
                                  title: "GEIGER Score",
                                  forceMaxHeight: false,
                                  mainContent: ShowScoreReason(
                                    align: TextAlign.center,
                                    reason: data.reason,
                                    status: data.status.toTitleCase,
                                  ),
                                );
                              },
                            ),
              ),
        );
    //: AppText.titleSmall(text: "RecalCulating score", context: context);
  }
}

class ShowScore extends StatelessWidget {
  const ShowScore({super.key, required this.builder, required this.isLoading});
  final bool isLoading;
  final WidgetBuilder builder;
  @override
  Widget build(BuildContext context) {
    return isLoading ? LoadingAnimation(size: 57.0) : builder(context);
  }
}

class _ScoreWithInfo extends StatelessWidget {
  const _ScoreWithInfo({super.key, required this.score, required this.showinfo});
  final String score;

  final VoidCallback showinfo;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).getScoreColor(int.parse(score));
    return Stack(
      alignment: Alignment.center,
      children: [
        ScoreContent(score: score, color: color, key: key),
        Positioned(
          top: -10, // Adjust position as needed
          right: -14,
          child: IconButton(onPressed: showinfo, icon: Icon(Icons.info_outline_rounded)),
        ),
      ],
    );
  }
}

class ScoreContent extends StatelessWidget {
  const ScoreContent({super.key, required this.score, this.color});
  final String score;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold, color: color ?? Colors.black);
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
      child: Text(score, style: textStyle, textAlign: TextAlign.center),
    );
  }
}

class ShowScoreReason extends StatelessWidget {
  const ShowScoreReason({super.key, required this.reason, required this.status, this.align});
  final String reason;
  final String status;

  final TextAlign? align;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ResponsiveCenterWidget(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).width * 0.3,
        child: RichText(
          text: TextSpan(
            style: theme.textTheme.bodySmall,
            children: [
              TextSpan(text: "$status: ", style: theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold)),
              TextSpan(text: reason),
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreStatusWidget extends ConsumerWidget {
  const ScoreStatusWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoreValue = ref.watch(watchGeigerScoreProvider);
    final theme = Theme.of(context);

    return AsyncValueWidget(
      value: scoreValue,
      data:
          (data) =>
              data == null
                  ? const SizedBox.shrink()
                  : TitleContent(title: data.status, color: theme.getScoreColor(data.geigerScore)),
    );
  }
}
