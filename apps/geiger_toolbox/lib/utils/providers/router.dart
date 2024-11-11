import 'package:geiger_toolbox/routing/app_routing.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'router.g.dart';

@riverpod
GoRouter goRouter(Ref ref) {
  return AppRouting.goRouter;
}
