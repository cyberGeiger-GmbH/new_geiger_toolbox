// ignore_for_file: avoid-returning-widgets

import 'package:core_ui/atoms/app_cached_network_image.dart';
import 'package:core_ui/molecules/bars/geiger_app_bar.dart';
import 'package:core_ui/organisms/news_content.dart';
import 'package:flutter/material.dart';

import '../helpers/design_system_helper.dart';
import '../molecules/cards/protection_tile.dart';
import '../molecules/cards/todo_tile.dart';
import '../organisms/list/protection_tile_list_view.dart';
import '../organisms/list/todo_tile_list_view.dart';
import '../organisms/show_bottom_sheet_modal.dart';
import '../tokens/spacing.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  //this is just for example purposes
  // * alway create a separate statless class
  ProtectionTileList _getProtectionTileList(BuildContext context) {
    final data = ["Two-Factor Authentication (2FA)", "VPN and Secure Connections", "Control Remote Access Software"];

    return ProtectionTileList(
      protectionTile:
          data
              .map(
                (value) => ProtectionTile.plain(
                  context: context,
                  title: value,
                  onPressed: () {
                    showWoltModalBottomSheet(context, title: value, page: _getTodoCheckList());
                  },
                ),
              )
              .toList(),
    );
  }

  //this is just for example purposes
  // * alway create a separa statless class
  TodoTileList _getTodoCheckList() {
    final List<Todo> data = [
      Todo(
        title: "Swiss Crime Prevention (SKP)",
        summary: "Provides informational materials and prevention campaigns on phone fraud",
      ),
      Todo(
        title: "Zurich Cantonal Police",
        summary: "Dedicated prevention pages with tips and information about phone fraud",
        value: true,
      ),
    ];

    return TodoTileList(
      todoTile:
          data
              .map(
                (value) => TodoTile.plain(
                  summary: value.summary,
                  title: value.title,
                  done: value.value,
                  // ignore: no-empty-block
                  onChange: (value) {},
                ),
              )
              .toList(), rationale: 'why',
    );
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: appColors.surface,
      appBar: const GeigerAppBar(title: "News"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppCachedNetworkImage.newsImage(imageUrl: "http://via.placeholder.com/350x150"),
          Spacing.gapH8,
          const NewsContent(
            title: "Cyberbetrug durch  Telefontricks  verbreitet",
            summary:
                "Cyberbetrug nimmt rasant zu, oft per Telefon. Bacs erhielt 2024 bereits 52'700 Meldungen, darunter viele gefälschte Behördenanrufe und Phishing-Angriffe. Ab 2025 wird für kritische Infrastrukturen eine Meldepflicht eingeführt.",
            lastedUpdated: "2024-12-12",
          ),
          Spacing.gapH16,
          ProtectionTileListWithTitle(title: "How to protect me?", protectionTileList: _getProtectionTileList(context)),
        ],
      ),
    );
  }
}
