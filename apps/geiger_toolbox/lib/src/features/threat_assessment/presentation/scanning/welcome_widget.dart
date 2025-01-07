import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_widget.dart';

class WelcomeWidget extends ConsumerWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [ScanButtonWidget()],
      ),
    );
  }
}
