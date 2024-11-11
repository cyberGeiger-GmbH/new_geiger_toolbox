import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/routing/app_routing.dart';
import 'package:go_router/go_router.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: EmptyPlaceholder(
          message: "404 - Page not found!".hardCoded,
          onTap: () {
            context.goNamed(AppRouter.home.name);
          },
        ));
  }
}
