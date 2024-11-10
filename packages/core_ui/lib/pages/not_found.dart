import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

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
              label: 'return to /',
              onTap: () {
               //todo
              },
            ),
          ],
        ),
      ),
    );
  }
}
