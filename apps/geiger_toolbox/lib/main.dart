

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';

void main() {
  //todo add error handlers
  runApp(const ProviderScope(
    child: GeigerApp(),
  ));
}


