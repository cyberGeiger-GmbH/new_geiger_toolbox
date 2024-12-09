import 'package:core_ui/gen/fonts.gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../tokens/spacing.dart';
part 'app_icons_data.freezed.dart';

@freezed
class AppIconsData with _$AppIconsData {
  const AppIconsData._();

  factory AppIconsData(
      {required String fontFamily,
      //required String fontPackage,
      required AppIconCharactersData character,
      required AppIconSizesData sizes}) = _AppIconData;

  factory AppIconsData.regular() => AppIconsData(
      fontFamily: FontFamily.geigerIcons,
      //fontPackage: "core_ui",
      character: AppIconCharactersData.regular(),
      sizes: AppIconSizesData.regular());
}

@freezed
class AppIconCharactersData with _$AppIconCharactersData {
  const AppIconCharactersData._();

  factory AppIconCharactersData({
    required String awareness,
    required String search,
    required String dataProtection,
    required String threat,
  }) = _AppIconCharactersData;

  factory AppIconCharactersData.regular() => AppIconCharactersData(
      awareness: String.fromCharCodes(
        [57739, 57394],
      ),
      search: String.fromCharCodes(
        [57344, 58146, 59425, 57533],
      ),
      dataProtection: String.fromCharCodes([57344, 61416, 58386, 57357]),
      threat: String.fromCharCodes([57344, 58178, 61170, 57575]));
}

@freezed
class AppIconSizesData with _$AppIconSizesData {
  const AppIconSizesData._();

  factory AppIconSizesData(
      {required double small,
      required double medium,
      required double large}) = _AppIconSizeData;

  factory AppIconSizesData.regular() => AppIconSizesData(
      small: Spacing.p16, medium: Spacing.p22, large: Spacing.p32);
}
