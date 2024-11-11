import 'package:core_ui/molecules/app_text.dart';
import 'package:flutter/material.dart';

///for showing empty content
class EmptyContent extends StatelessWidget {
  const EmptyContent(
      {super.key,
      this.title = "Nothing Here",
      this.message = "Add a new item to get started"});

  final String title;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText.titleLarge(text: title, context: context),
          AppText.bodyMedium(text: message, context: context),
        ],
      ),
    );
  }
}
