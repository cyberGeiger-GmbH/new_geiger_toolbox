import 'package:core_ui/env/env.dart';
import 'package:core_ui/molecules/centered_text_button.dart';
import 'package:core_ui/routing/core_router.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//home screen
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("environment type =>  ${Env.type}");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("home"),
        if (Env.type.contains("designSystem"))
          CenteredTextButton.tertiary(
            label: "view design system",
            onTap: () {
              context.goNamed(CoreAppRouter.designSystem.name);
            },
            context: context,
          )
      ],
    );
  }
}
