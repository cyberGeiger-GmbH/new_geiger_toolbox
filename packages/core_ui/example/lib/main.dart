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
      title: 'Flutter Demo',
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: Theme.of(context).appTextStyles.appTextStyle.displaySmall,
            ),
            Text(
              '$_counter',
              style: Theme.of(context)
                  .appTextStyles
                  .appTextStyle
                  .displayLarge
                  .copyWith(
                      color: Theme.of(context).appColors.appColor.primary),
            ),
            Text(
              Theme.of(context).appIcons.appIcon.character.search,
              style: TextStyle(
                  fontSize: Theme.of(context).appIcons.appIcon.sizes.large),
            ),
            Theme.of(context).appImages.imagesData.name,

            DesignSystemHelper.getColors(),
            DesignSystemHelper.getTexts(),
            DesignSystemHelper.getAppButtons(),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
