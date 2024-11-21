import 'package:flutter/material.dart';

import '../molecules/texts/app_text.dart';

///for showing empty content
class EmptyContent extends StatelessWidget {
  const EmptyContent(
      {super.key,
      this.title,
      this.message = "Add a new item to get started",
      this.color,
      this.textAlign});

  final String? title;
  final String message;
  final Color? color;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        title == null
            ? const SizedBox.shrink()
            : AppText.titleLarge(
                textAlign: textAlign,
                text: title ?? "",
                color: color,
                context: context),
        AppText.bodyMedium(
          text: message,
          color: color,
          context: context,
          textAlign: textAlign,
        ),
      ],
    );
  }
}
