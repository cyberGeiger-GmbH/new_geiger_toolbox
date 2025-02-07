import 'package:core_ui/molecules/texts/app_text.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class TodoTile extends StatelessWidget {
  const TodoTile._(
      {super.key,
      required this.title,
      required this.summary,
      this.onChange,
      this.decoration,
      this.done = false});

  factory TodoTile.plain(
      {Key? key,
      required String title,
      required String summary,
      ValueChanged<bool?>? onChange,
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
      ValueChanged<bool?>? onChange,
      required BuildContext context,
      bool done = false}) {
    final appColors = Theme.of(context).colorScheme;

    return TodoTile._(
      key: key,
      decoration: Utils.getDecoration(appColors),
      title: title,
      summary: summary,
      onChange: onChange,
      done: done,
    );
  }

  final String title;
  final String summary;
  final bool done;
  final ValueChanged<bool?>? onChange;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;

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
    this.appColors,
    required this.summary,
    required this.done,
    this.onChange,
  });

  final String title;
  final ColorScheme? appColors;
  final String summary;
  final bool done;
  final ValueChanged<bool?>? onChange;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AppText.titleMedium(
        text: title,
        context: context,
      ),
      subtitle: AppText.bodySmall(
        text: summary,
        context: context,
      ),
      trailing: Checkbox.adaptive(
        value: done,
        onChanged: onChange,
        activeColor: appColors!.primary,
      ),
    );
  }
}
