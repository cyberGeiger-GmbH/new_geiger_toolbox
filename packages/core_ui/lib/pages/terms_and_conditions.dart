import 'package:core_ui/molecules/centered_text_button.dart';
import 'package:core_ui/routing/core_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("Terms and Condition Screent"),
          ),
          CenteredTextButton.tertiary(
            label: "Home",
            onTap: () {
              context.goNamed(CoreAppRouter.home.name);
            },
            context: context,
          ),
        ],
      ),
    );
  }
}
