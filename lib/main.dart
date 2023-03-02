import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_logiccontext_ds/service/theme_manager.dart';
import 'package:provider/provider.dart';

import 'oxide/theme.dart';
import 'screens/about_screen.dart';
import 'screens/show_color_scheme.dart';

void main() {
  runApp(const MyApp());
}

// https://m3.material.io/develop/flutter
// https://flutter.github.io/samples/web/material_3_demo/#/
// https://github.com/flutter/samples/tree/main/material_3_demo
// https://pub.dev/packages/flutter_adaptive_scaffold/example
// https://docs.flutter.dev/development/ui/widgets/material
// https://fonts.google.com/
// https://www.youtube.com/@MaterialDesign/videos

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LogicContextThemeManager theme = LogicContextThemeManager(useMaterial3: false, manualOrAuto: true);

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeManager>(
          create: (context) => ThemeManager(),
        ),
      ],
      child: MaterialApp(
        title: 'LogicContextXI',
        theme: theme.lightTheme,
        darkTheme: theme.darkTheme,
        highContrastTheme: theme.highContrastTheme,
        highContrastDarkTheme: theme.highContrastDarkTheme,
        themeMode: _themeManager.themeMode,
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'LogicContext'),
        //home: ColorPalettesScreen(),
        //home: ReverseScreen(),
      ),
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
  int _counter = 0;

  bool useMaterial3 = true;
  ThemeMode themeMode = ThemeMode.light;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(builder: (BuildContext context) {
          return Text(AppData.title(context));
        }),
        actions: <Widget>[
          const AboutIconButton(),
          IconButton(
            icon: themeMode == ThemeMode.dark
                ? const Icon(Icons.wb_sunny_outlined)
                : const Icon(Icons.wb_sunny),
            onPressed: () {
              setState(() {
                if (themeMode == ThemeMode.light) {
                  _themeManager.toggleTheme(false);
                  themeMode = ThemeMode.dark;
                } else {
                  _themeManager.toggleTheme(true);
                  themeMode = ThemeMode.light;
                }
              });
            },
            tooltip: 'Toggle brightness',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: Center(
          child: Column(
            children: const <Widget>[
              ShowColorSchemeColors(),
              Divider(
                height: 5,
              ),
            ],
          ),
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
