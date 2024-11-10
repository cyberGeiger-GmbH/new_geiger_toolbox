import 'package:core_ui/molecules/centered_text_button.dart';
import 'package:flutter/material.dart';

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
             //todo
            },
            context: context,
          ),
        ],
      ),
    );
  }
}
