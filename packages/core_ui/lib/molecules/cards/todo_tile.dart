import 'package:core_ui/foundation/app_colors.dart';
import 'package:core_ui/foundation/themes/extension.dart';
import 'package:core_ui/molecules/texts/app_text.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class TodoTile extends StatelessWidget {
  const TodoTile._(
      {super.key,
      required this.title,
      required this.summary,
      required this.onChange,
      this.decoration,
      this.done = false});

  final String title;
  final String summary;
  final bool done;
  final ValueChanged onChange;
  final BoxDecoration? decoration;

  factory TodoTile.plain(
      {Key? key,
      required String title,
      required String summary,
      required ValueChanged onChange,
      bool done = false}) {
    return TodoTile._(
      key: key,
      title: title,
      summary: summary,
      onChange: onChange,
      done: done,
    );
  }

  factory TodoTile.outlined(
      {Key? key,
      required String title,
      required String summary,
      required ValueChanged onChange,
      required BuildContext context,
      bool done = false}) {
    final appColors = Theme.of(context).appColors.appColor;
    return TodoTile._(
      key: key,
      decoration: Utils.getDecoration(appColors),
      title: title,
      summary: summary,
      onChange: onChange,
      done: done,
    );
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors.appColor;
    return Container(
      decoration: decoration,
      child: _ContentWidget(
          key: key,
          title: title,
          appColors: appColors,
          summary: summary,
          done: done,
          onChange: onChange),
    );
  }
}

class _ContentWidget extends StatelessWidget {
  const _ContentWidget({
    super.key,
    required this.title,
    required this.appColors,
    required this.summary,
    required this.done,
    required this.onChange,
  });

  final String title;
  final AppColors appColors;
  final String summary;
  final bool done;
  final ValueChanged onChange;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AppText.titleMedium(
        text: title,
        context: context,
        color: appColors.defaultColor,
      ),
      subtitle: AppText.bodySmall(
        text: summary,
        context: context,
        color: appColors.defaultColor,
      ),
      trailing: Checkbox.adaptive(
        value: done,
        onChanged: onChange,
        activeColor: appColors.primary,
      ),
    );
  }
}
