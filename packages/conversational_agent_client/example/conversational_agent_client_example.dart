import 'package:conversational_agent_client/src/data/respository/news_repository.dart';
import 'package:conversational_agent_client/src/domain/news.dart';
import 'package:conversational_agent_client/src/utilities/providers/dio_client_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

void main() async {
  // a method to create your container  and to optionally override the default provider client with yours
  ProviderContainer getContainer(Dio? client) {
    return client != null
        ? ProviderContainer(
            overrides: [
              dioProvider.overrideWithValue(client),
            ],
          )
        : ProviderContainer();
  }

//get your container using your client
  final containerWithOverride = getContainer(Dio());
  //read the new repository class
  final newRepo = containerWithOverride.read(newsRepositoryProvider);
  //news object will be empty without  passing a profile
  final List<News> news = await newRepo.fetchNews();

  print('awesome: $news');
}
