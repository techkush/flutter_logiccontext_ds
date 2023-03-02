import 'package:flutter/material.dart';

import 'generate/seed_scheme.dart';
import 'generate/tonal_config.dart';
import 'generate/tonal_enum.dart';
import 'manual/custom_theme.dart';
import 'manual/dark_theme.dart';
import 'manual/light_theme.dart';

// Define your seed colors.
const Color primarySeedColor = Colors.blue;
const Color secondarySeedColor = Colors.deepPurpleAccent;
const Color tertiarySeedColor = Colors.amber;

ColorScheme selectedSeedScheme({
  required Brightness brightness,
  required FlexTones tones,
  required bool useSecondaryKey,
  required bool useTertiaryKey,
}) =>
    SeedColorScheme.fromSeeds(
      brightness: brightness,
      primaryKey: primarySeedColor,
      secondaryKey: useSecondaryKey ? secondarySeedColor : null,
      tertiaryKey: useTertiaryKey ? tertiarySeedColor : null,
      tones: tones,
    );

class LogicContextThemeManager {
  late bool useMaterial3;
  bool manualOrAuto = true;
  bool useTertiaryKey = true;
  bool useSecondaryKey = true;
  FlexTonesEnum usedTone = FlexTonesEnum.custom;

  LogicContextThemeManager(
      {required this.useMaterial3, required this.manualOrAuto});

  late ThemeData lightTheme = manualOrAuto
      ? ThemeData.from(
          colorScheme: selectedSeedScheme(
            brightness: Brightness.light,
            tones: usedTone
                .tones(Brightness.light)
                .onMainsUseBW(true)
                .onSurfacesUseBW(true),
            useSecondaryKey: useSecondaryKey,
            useTertiaryKey: useTertiaryKey,
          ),
          useMaterial3: useMaterial3,
        )
      : ThemeData(
          colorScheme: lightColorScheme,
          useMaterial3: useMaterial3,
          extensions: [lightCustomColors]);

  late ThemeData darkTheme = manualOrAuto
      ? ThemeData.from(
          colorScheme: selectedSeedScheme(
            brightness: Brightness.dark,
            tones: usedTone
                .tones(Brightness.dark)
                .onMainsUseBW(true)
                .onSurfacesUseBW(true),
            useSecondaryKey: useSecondaryKey,
            useTertiaryKey: useTertiaryKey,
          ),
          useMaterial3: useMaterial3,
        )
      : ThemeData(
          colorScheme: darkColorScheme,
          useMaterial3: useMaterial3,
          extensions: [darkCustomColors]);

  late ThemeData highContrastTheme = ThemeData.from(
    colorScheme: SeedColorScheme.fromSeeds(
      brightness: Brightness.light,
      primaryKey: primarySeedColor,
      secondaryKey: secondarySeedColor,
      tertiaryKey: tertiarySeedColor,
      tones: FlexTones.ultraContrast(Brightness.light),
    ),
    useMaterial3: useMaterial3,
  );

  late ThemeData highContrastDarkTheme = ThemeData.from(
    colorScheme: SeedColorScheme.fromSeeds(
      brightness: Brightness.dark,
      primaryKey: primarySeedColor,
      secondaryKey: secondarySeedColor,
      tertiaryKey: tertiarySeedColor,
      tones: FlexTones.ultraContrast(Brightness.dark),
    ),
    useMaterial3: useMaterial3,
  );
}
