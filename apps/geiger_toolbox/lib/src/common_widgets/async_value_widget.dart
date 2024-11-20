import 'package:core_ui/organisms/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget(
      {super.key, required this.value, required this.data, this.loadingWidget});
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget? loadingWidget;
  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, s) => Center(
        child: ErrorMessage(
          errorMessage: e.toString(),
        ),
      ),
      loading: () =>
          loadingWidget ?? const Center(child: CircularProgressIndicator()),
    );
  }
}
