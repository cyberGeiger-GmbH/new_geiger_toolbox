import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Page Not Found"),
            CenteredTextButton.primary(
              context: context,
              label: 'go back',
              onTap: () {
                context.goNamed(CoreAppRouter.home.name);
              },
            ),
            CenteredTextButton.primary(
              context: context,
              label: 'Terms and Conditions',
              onTap: () {
                context.goNamed(CoreAppRouter.termsAndCondation.name);
              },
            )
          ],
        ),
      ),
    );
  }
}
