import 'package:core_ui/core_ui.dart';
import 'package:core_ui/foundation/themes/app_images_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toolbox Styling',
      theme: Theme.of(context).copyWith(
        extensions: [
          AppColorsTheme.light(),
          AppTextStyleTheme.main(),
          AppIconsTheme.main(),
          AppImagesTheme.main(),
          AppDimensionsTheme.regular(View.of(context)),
        ],
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: appTheme.appColors.appColor.scaffoldBackgroundColor,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              Theme.of(context).appIcons.appIcon.character.search,
              style: TextStyle(
                  fontSize: Theme.of(context).appIcons.appIcon.sizes.large),
            ),
            Theme.of(context).appImages.imagesData.name,
            DesignSystemHelper.getColors(),
            DesignSystemHelper.getTexts(),
            DesignSystemHelper.getAppButtons(),
            DesignSystemHelper.getCategoriesCard()
          ],
        ),

        // CenteredTextButton.primary(
        //     label: "primary button", onTap: () {}, context: context),
        // CenteredTextButton.primary(
        //     label: "disabled primary button",
        //     isEnabled: false,
        //     onTap: () {},
        //     context: context),
        // CenteredTextButton.secondary(
        //     label: "secondary button", onTap: () {}, context: context),
        // CenteredTextButton.tertiary(
        //     label: "tertiary button", onTap: () {}, context: context),
        // CenteredTextButton.secondary(
        //     label: "disabled secondary button",
        //     isEnabled: false,
        //     onTap: () {},
        //     context: context),
      ),
    );
  }
}
