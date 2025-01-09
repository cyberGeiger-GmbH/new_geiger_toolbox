import 'package:flutter_riverpod/flutter_riverpod.dart';

class PerplexityRepository {
  final Ref ref;
  PerplexityRepository(this.ref);

  Future<String> getCompanyDescription()async{
    final repo = ref.read(perpo)
  }
}
