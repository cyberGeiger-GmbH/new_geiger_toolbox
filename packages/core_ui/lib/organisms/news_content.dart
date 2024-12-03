import 'package:core_ui/foundation/themes/extension.dart';
import 'package:core_ui/molecules/texts/app_text.dart';
import 'package:core_ui/organisms/empty_content.dart';
import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';

class NewsContent extends StatelessWidget {
  const NewsContent(
      {super.key,
      required this.summary,
      this.source,
      required this.articleUrl,
      required this.title});
  final String summary;
  final String? source;
  final String articleUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors.appColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.titleLarge(
          text: title,
          context: context,
          color: appColors.defaultColor,
        ),
        Spacing.gapH4,
        EmptyContent(
            color: appColors.defaultColor,
            textAlign: TextAlign.justify,
            message: summary),
        Spacing.gapH4,
        // _HorizontalTitleContent(
        //     key: key, title: source ?? "Source", source: articleUrl),
      ],
    );
  }
}

// class _HorizontalTitleContent extends StatelessWidget {
//   const _HorizontalTitleContent(
//       {super.key, required this.title, required this.source});
//   final String title;
//   final String source;
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final appTextStyle = theme.appTextStyles;
//     final appColors = theme.appColors.appColor;
//     return RichText(
//       text: TextSpan(
//         text: "$title: ", // Title in bold
//         style: appTextStyle.appTextStyle.titleSmall.copyWith(
//             fontWeight: FontWeight.bold, color: appColors.defaultColor),
//         children: [
//           TextSpan(
//             text: source, // Message in normal style
//             style: appTextStyle.appTextStyle.bodySmall
//                 .copyWith(color: Colors.grey),
//           ),
//         ],
//       ),
//     );
//   }
// }
