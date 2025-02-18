import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart'; // Mandatory
part 'user_profile_model.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({required Profile currentUserProfile, Profile? previousUserProfile}) =
      _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => _$UserProfileModelFromJson(json);
}

@freezed
class Profile with _$Profile {
  const factory Profile({required String id, required Actor actor, required List<NewsActicle> news}) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}

@freezed
class Actor with _$Actor {
  const factory Actor({
    String? companyName,
    String? location,
    String? companyDescription,
    required Asset userDevice,
    String? score,
    required String locale,
    required List<Asset> assets,
  }) = _Actor;

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
}

@freezed
class Asset with _$Asset {
  const factory Asset({required String type, required String version, required String model}) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}

@freezed
class NewsActicle with _$NewsActicle {
  const factory NewsActicle({
    required String id,
    required String name,
    required String description,
    required String type,
    required List<Protection> protection,
  }) = _Definition;

  factory NewsActicle.fromJson(Map<String, dynamic> json) => _$NewsActicleFromJson(json);
}

@freezed
class Protection with _$Protection {
  const factory Protection({required String name, required String summary, required String status}) = _Protection;

  factory Protection.fromJson(Map<String, dynamic> json) => _$ProtectionFromJson(json);
}
