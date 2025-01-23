import 'package:core_ui/organisms/show_bottom_sheet_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/geiger_score_service.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/geiger_score_info.dart';

class ScoreWidget extends ConsumerWidget {
  const ScoreWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoreValue = ref.watch(watchGeigerScoreProvider);
    return AsyncValueWidget(
      value: scoreValue,
      data: (data) => data != null
          ? _ScoreWithInfo(
              score: "${data.geigerScore}",
              key: key,
              showinfo: () {
                showWoltAlertDialog(
                  context,
                  title: "Geiger Score!",
                  page: ShowScoreReason(
                    reasons: data.reasons,
                  ),
                );
              },
            )
          : SizedBox.shrink(),
    );
  }
}

class ShowScoreReason extends StatelessWidget {
  const ShowScoreReason({super.key, required this.reasons});
  final List<ScoreReason> reasons;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: ListTile.divideTiles(
        context: context,
        tiles: reasons.map(
          (data) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(data.name),
          ),
        ),
      ).toList(),
    );
  }
}

class _ScoreWithInfo extends StatelessWidget {
  const _ScoreWithInfo(
      {super.key, required this.score, required this.showinfo, this.color});
  final String score;
  final Color? color;
  final VoidCallback showinfo;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _ScoreContent(
          score: score,
          color: color,
          key: key,
        ),
        Positioned(
          top: -10, // Adjust position as needed
          right: -14,
          child: IconButton(
            onPressed: showinfo,
            icon: Icon(Icons.info_outline_rounded),
          ),
        ),
      ],
    );
  }
}

class _ScoreContent extends StatelessWidget {
  const _ScoreContent({super.key, required this.score, this.color});
  final String score;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.displayLarge!
        .copyWith(fontWeight: FontWeight.bold, color: color ?? Colors.black);
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
      child: Text(
        score,
        style: textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
