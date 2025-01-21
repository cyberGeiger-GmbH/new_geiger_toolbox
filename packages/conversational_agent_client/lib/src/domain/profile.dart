import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart'; // Mandatory
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    required String id,
    Actor? actor,
    required Verb verb,
    final ActingObject? object,
    final Result? result,
    required DateTime timestamp,
  }) = _Profile;

  ///Profile constructor to set a default value for createdAt
  factory Profile.withDefaultTimestamp({
    required String id,
    required Actor actor,
    required Verb verb,
    ActingObject? object,
    final Result? result,
  }) {
    return Profile(
      id: id,
      actor: actor,
      verb: verb,
      object: object,
      result: result,
      timestamp: DateTime.now(),
    );
  }

  factory Profile.withoutActor({
    required String id,
    required Verb verb,
    required Asset currentDevice,
    ActingObject? object,
    final Result? result,
  }) {
    return Profile(
      id: id,
      actor: Actor(userDevice: currentDevice, assets: []),
      verb: verb,
      object: object,
      result: result,
      timestamp: DateTime.now(),
    );
  }

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

@freezed
class Actor with _$Actor {
  const factory Actor({
    String? companyName,
    String? location,
    required Asset userDevice,
    @Default("en") String? locale,
    String? companyDescription,
    @Default(true) bool? smeOwner,
    required List<Asset> assets,
  }) = _Actor;

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
}

@freezed
class Asset with _$Asset {
  const factory Asset({
    required String type,
    required String version,
    required String model,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}

@freezed
class Verb with _$Verb {
  const factory Verb({
    required String name,
  }) = _Verb;
  factory Verb.fromJson(Map<String, dynamic> json) => _$VerbFromJson(json);
}

@freezed
class ActingObject with _$ActingObject {
  const factory ActingObject({required List<Definition> definition}) =
      _ActingObject;
  factory ActingObject.fromJson(Map<String, dynamic> json) =>
      _$ActingObjectFromJson(json);
}

@freezed
class Definition with _$Definition {
  const factory Definition(
      {required String id,
      required String name,
      required String description,
      required List<DefinitionExtension> extensions}) = _Definition;

  factory Definition.fromJson(Map<String, dynamic> json) =>
      _$DefinitionFromJson(json);
}

@freezed
class DefinitionExtension with _$DefinitionExtension {
  const factory DefinitionExtension(
      {required String recommendationType,
      required List<Implementation> implementations}) = _DefinitionExtension;

  factory DefinitionExtension.fromJson(Map<String, dynamic> json) =>
      _$DefinitionExtensionFromJson(json);
}

@freezed
class Implementation with _$Implementation {
  const factory Implementation(
      {required String name,
      required String summary,
      required bool implemented}) = _Implementation;

  factory Implementation.fromJson(Map<String, dynamic> json) =>
      _$ImplementationFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    required bool success,
    required bool completions,
    required ResultExtensions extensions,
  }) = _Result;
  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class ResultExtensions with _$ResultExtensions {
  const factory ResultExtensions({
    required String geigerScore,
    required DateTime lastUpdated,
    required List<String> reasons,
  }) = _ResultExtensions;

  factory ResultExtensions.withDefaultTimestamp({
    required String geigerScore,
    required List<String> reasons,
  }) =>
      ResultExtensions(
          geigerScore: geigerScore,
          lastUpdated: DateTime.now(),
          reasons: reasons);

  factory ResultExtensions.fromJson(Map<String, dynamic> json) =>
      _$ResultExtensionsFromJson(json);
}
