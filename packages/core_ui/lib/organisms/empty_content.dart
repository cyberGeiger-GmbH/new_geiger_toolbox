import 'package:flutter/material.dart';

import '../molecules/texts/app_text.dart';

///for showing empty content
class EmptyContent extends StatelessWidget {
  const EmptyContent(
      {super.key,
      this.title = "Nothing Here",
      this.message = "Add a new item to get started",
      this.color});

  final String title;
  final String message;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText.titleLarge(text: title, color: color, context: context),
          AppText.bodyMedium(text: message, color: color, context: context),
        ],
      ),
    );
  }
}
