import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_geiger_score_repository.g.dart';

class RemoteGeigerScoreRepository {
  final Ref ref;

  RemoteGeigerScoreRepository(this.ref);

  Future<GeigerScore?> geigerScore({required UserProfileModel profile}) async {
    final scoreRepo = ref.read(geigerScoreRepositoryProvider);
    final data = await scoreRepo.fetchGeigerScore(userProfile: profile);
    return data;
  }
}

@riverpod
Future<GeigerScore?> getGeigerScore(Ref ref, {required UserProfileModel userProfile}) {
  final instance = RemoteGeigerScoreRepository(ref);
  
  return instance.geigerScore(profile: userProfile);
}
