import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({super.key, required this.value, required this.data, this.loadingWidget, this.error, this.onRetry});
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget? loadingWidget;
  final Widget Function(Object, StackTrace)? error;
  final VoidCallback? onRetry;
  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: error ?? (e, s) => ResponsiveCenterWidget(child: ErrorMessage(message: "$e", onRetry: onRetry)),
      loading: () => loadingWidget ?? const Center(child: CircularProgressIndicator()),
    );
  }
}
