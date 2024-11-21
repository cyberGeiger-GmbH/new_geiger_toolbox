import 'package:core_ui/atoms/app_cached_network_image.dart';
import 'package:core_ui/foundation/themes/extension.dart';
import 'package:core_ui/molecules/bars/custom_app_bar.dart';
import 'package:core_ui/organisms/news_content.dart';
import 'package:flutter/material.dart';

import '../helpers/design_system_helper.dart';
import '../organisms/list/protection_tile_list.dart';
import '../tokens/spacing.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors.appColor;
    return Scaffold(
      backgroundColor: appColors.scaffoldBackgroundColor,
      appBar: const CustomAppBar(
        title: "News",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCachedNetworkImage.newsImage(
              imageUrl: "http://via.placeholder.com/350x150"),
          Spacing.gapH8,
          const NewsContent(
              title: "Cyberbetrug durch  Telefontricks  verbreitet",
              summary:
                  "Cyberbetrug nimmt rasant zu, oft per Telefon. Bacs erhielt 2024 bereits 52'700 Meldungen, darunter viele gefälschte Behördenanrufe und Phishing-Angriffe. Ab 2025 wird für kritische Infrastrukturen eine Meldepflicht eingeführt.",
              articleUrl: "facebook"),
          Spacing.gapH16,
          ProtectionTileListWithTitle(
            title: "How to protect me?",
            widget: DesignSystemHelper.getTileList(),
          ),
        ],
      ),
    );
  }
}
