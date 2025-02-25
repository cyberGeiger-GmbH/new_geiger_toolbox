import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_controller.dart';

class ScanButtonWidget extends ConsumerWidget {
  const ScanButtonWidget({super.key, required this.onScanPressed});

  final VoidCallback onScanPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(scanButtonControllerProvider);
    final newsFeedState = ref.watch(watchRecentNewsFeedsProvider);

    // return AppButton.scan(
    //   label: state.isLoading || newsFeedState.isLoading ? "scanning..." : 'Scan',
    //   context: context,
    //   onPressed: state.isLoading ? null : onScanPressed,
    // );

    return CircularScanningButton(
      onPressed: () {},
      //label: state.isLoading || newsFeedState.isLoading ? "scanning..." : 'Scan',
      size: 120.0,
      color: theme.colorScheme.primary,
    );
  }
}

class CircularScanningButton extends StatefulWidget {
  final VoidCallback onPressed;
  final double size;
  final Color color;
  final String loadStateLabel;
  final String initStatelabel;

  const CircularScanningButton({
    super.key,
    required this.onPressed,
    this.loadStateLabel = 'Scanning',
    this.size = 0.0,
    this.color = Colors.blueAccent,
    this.initStatelabel = 'Scan',
  });

  @override
  _CircularScanningButtonState createState() => _CircularScanningButtonState();
}

class _CircularScanningButtonState extends State<CircularScanningButton> {
  bool isLoading = false;

  void _handleTap() async {
    if (!mounted) return;
    setState(() {
      isLoading = true;
    });

    // Simulate a scanning process
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;
    setState(() {
      isLoading = false;
    });

    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : _handleTap,
      child: Material(
        elevation: 3.0,
        shape: const CircleBorder(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: widget.size + 20,
              height: widget.size + 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: widget.color.withAlpha(128), width: 5.0),
              ),
            ),

            Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(shape: BoxShape.circle, color: widget.color),
              child: Center(
                child:
                    isLoading
                        ? ScanningText(size: widget.size, state: widget.loadStateLabel)
                        : Text(
                          widget.initStatelabel,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScanningText extends ConsumerWidget {
  const ScanningText({super.key, required this.size, required this.state});
  final double size;
  final String state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    return Stack(
      alignment: Alignment.center,
      children: [
        //child:
        AppText.labelLarge(text: state, context: context, color: color.onPrimary, fontWeight: FontWeight.bold),
        LoadingAnimationWidget.threeArchedCircle(color: color.onPrimary, size: size * 0.9),
        // ),
      ],
    );
  }
}
