import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/common_widgets/geiger_card.dart';

import 'package:geiger_toolbox/src/common_widgets/section_heading.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_details/offerings/offering_item.dart';

class OfferingItemList extends StatelessWidget {
  const OfferingItemList({super.key, required this.offerings, required this.explanation});

  final List<TodoOffering> offerings;
  final String explanation;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        AppText.bodyMedium(text: explanation, context: context, textAlign: TextAlign.justify),
        Spacing.gapH32,
        SectionHeading(title: "Recommended Todos"),
        Spacing.gapH22,
        GeigerCard(
          items:
              offerings.map((offer) {
                return OfferingItem(offer: offer);
              }).toList(),
        ),
      ],
    );
  }
}
