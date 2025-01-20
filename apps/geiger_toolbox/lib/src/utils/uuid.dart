import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
part 'uuid.g.dart';

@riverpod
String getUuid(Ref ref) {
  final uuid = Uuid();
  return uuid.v1();
}
