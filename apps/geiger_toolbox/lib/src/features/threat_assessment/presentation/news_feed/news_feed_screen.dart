import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/extensions/string_extension.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key, required this.newsTitle});
  final String newsTitle;
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors.appColor;
    return Scaffold(
      backgroundColor: appColors.scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: newsTitle.replaceHyphenWithSpace.toTitleCase,
      ),
      body: Center(
        child: Text("threat id => $newsTitle"),
      ),
    );
  }
}
