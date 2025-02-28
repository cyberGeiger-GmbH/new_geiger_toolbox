import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/routing/app_routing.dart';
import 'package:go_router/go_router.dart';

void navigateToNewsDetails({required String newsId, required BuildContext context}) {
  context.goNamed(AppRouter.newDetailsRouter.name, pathParameters: {AppRouter.newDetailsRouter.name: newsId});
}

void navigateToMainScreen({required BuildContext context}) {
  context.goNamed(AppRouter.mainRouter.name);
  //pop current context
  context.pop();
}
