//import 'package:core_ui/core_ui.dart';
// import 'package:core_ui/molecules/buttons/app_icon_button.dart';
// import 'package:flutter/foundation.dart';
//import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
// import 'package:geiger_toolbox/src/features/threat_assessment/applications/geiger_score_service.dart';

// import 'package:geiger_toolbox/src/features/threat_assessment/presentation/geiger_score/score_message_controller.dart';

// class ScoreMessageWidget extends ConsumerWidget {
//   const ScoreMessageWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final scoreValue = ref.watch(watchGeigerScoreProvider);
//     final state = ref.watch(scoreControllerMessageProvider);

//     //show message when [watchGeigerScoreListProvider] has value
//     ref.listen(watchGeigerScoreProvider, (_, value) {
//       if (!value.isLoading && !value.hasError) {
//         if (value.value != null) {
//           ref.read(scoreControllerMessageProvider.notifier).dismissableMessage(false);
//         }
//       }
//     });

//     return AsyncValueWidget(
//       value: scoreValue,
//       data:
//           (data) =>
//               data != null && !state
//                   ? AlertMessageBox(
//                     reason: data.reason,
//                     status: data.status,
//                     icons: Icons.message,
//                     onClose: () {
//                       ref.read(scoreControllerMessageProvider.notifier).dismissableMessage(true);
//                     },
//                   )
//                   : SizedBox.shrink(),
//     );
//   }
// }

// class AlertMessageBox extends StatelessWidget {
//   const AlertMessageBox({super.key, required this.reason, required this.status, this.onClose, this.icons});
//   final String reason;
//   final VoidCallback? onClose;
//   final IconData? icons;
//   final String status;

//   //for debugging purpose
//   // to show custom properties in the devTools
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(DiagnosticsProperty<String>("reasons", reason));
//     // properties.add(Diagnosti)
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(Spacing.p8),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             HorizontalContent(title: "GEIGER Score Update", onClose: onClose, icons: icons),
//             Spacing.gapH8,
//             ShowScoreReason(reason: reason, align: TextAlign.center, status: status),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HorizontalContent extends StatelessWidget {
//   const HorizontalContent({super.key, required this.title, this.onClose, this.icons});
//   final String title;
//   final IconData? icons;
//   final VoidCallback? onClose;
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Row(
//       children: [
//         IconTitle(icons: icons ?? Icons.score),
//         Spacing.gapW16,
//         Expanded(child: AppText.headlineSmall(text: title, context: context)),
//         AppIconButton.filledTonal(
//           iconData: Icons.close,
//           context: context,
//           onPressed: onClose,
//           backgroudColor: theme.colorScheme.surface,
//         ),
//       ],
//     );
//   }
// }

// class IconTitle extends StatelessWidget {
//   const IconTitle({super.key, required this.icons});
//   final IconData icons;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 50,
//       height: 50,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(Spacing.p8), color: Colors.grey.shade800),
//       child: Icon(icons, color: Colors.white),
//     );
//   }
// }


