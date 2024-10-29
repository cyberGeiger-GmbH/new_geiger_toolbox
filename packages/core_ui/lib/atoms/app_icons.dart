import 'package:core_ui/gen/fonts.gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_icons.freezed.dart';


@freezed
class AppIconData with _$AppIconData {
  const AppIconData._();

  factory AppIconData(
      {required String fontFamily,
      //required String fontPackage,
      required AppIconCharactersData character,
      required AppIconSizesData sizes}) = _AppIconData;

  factory AppIconData.regular() => AppIconData(
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

  factory AppIconSizesData.regular() =>
      AppIconSizesData(small: 16.0, medium: 22.0, large: 32.0);
}
