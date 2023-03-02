import 'package:flutter/foundation.dart';

@immutable
class FlexTones with Diagnosticable {
  const FlexTones({
    required this.primaryTone,
    required this.onPrimaryTone,
    required this.primaryContainerTone,
    required this.onPrimaryContainerTone,
    required this.secondaryTone,
    required this.onSecondaryTone,
    required this.secondaryContainerTone,
    required this.onSecondaryContainerTone,
    required this.tertiaryTone,
    required this.onTertiaryTone,
    required this.tertiaryContainerTone,
    required this.onTertiaryContainerTone,
    required this.errorTone,
    required this.onErrorTone,
    required this.errorContainerTone,
    required this.onErrorContainerTone,
    required this.backgroundTone,
    required this.onBackgroundTone,
    required this.surfaceTone,
    required this.onSurfaceTone,
    required this.surfaceVariantTone,
    required this.onSurfaceVariantTone,
    required this.outlineTone,
    required this.outlineVariantTone,
    required this.shadowTone,
    required this.scrimTone,
    required this.inverseSurfaceTone,
    required this.onInverseSurfaceTone,
    required this.inversePrimaryTone,
    required this.surfaceTintTone,
    this.primaryChroma,
    required this.primaryMinChroma,
    this.secondaryChroma,
    required this.secondaryMinChroma,
    this.tertiaryChroma,
    required this.tertiaryMinChroma,
    required this.tertiaryHueRotation,
    this.errorChroma,
    required this.errorMinChroma,
    this.neutralChroma,
    required this.neutralMinChroma,
    this.neutralVariantChroma,
    required this.neutralVariantMinChroma,
  });

  const FlexTones.light({
    this.primaryTone = 40,
    this.onPrimaryTone = 100,
    this.primaryContainerTone = 90,
    this.onPrimaryContainerTone = 10,
    this.secondaryTone = 40,
    this.onSecondaryTone = 100,
    this.secondaryContainerTone = 90,
    this.onSecondaryContainerTone = 10,
    this.tertiaryTone = 40,
    this.onTertiaryTone = 100,
    this.tertiaryContainerTone = 90,
    this.onTertiaryContainerTone = 10,
    this.errorTone = 40,
    this.onErrorTone = 100,
    this.errorContainerTone = 90,
    this.onErrorContainerTone = 10,
    this.backgroundTone = 99,
    this.onBackgroundTone = 10,
    this.surfaceTone = 99,
    this.onSurfaceTone = 10,
    this.surfaceVariantTone = 90,
    this.onSurfaceVariantTone = 30,
    this.outlineTone = 50,
    this.outlineVariantTone = 80,
    this.shadowTone = 0,
    this.scrimTone = 0,
    this.inverseSurfaceTone = 20,
    this.onInverseSurfaceTone = 95,
    this.inversePrimaryTone = 80,
    this.surfaceTintTone = 40,
    // Defaults to null, chroma in key color is used, if over primaryMinChroma.
    this.primaryChroma,
    this.primaryMinChroma = 48,
    // Defaults to null, chroma in key is used, if over secondaryMinChroma.
    this.secondaryChroma,
    this.secondaryMinChroma = 0,
    // Defaults to null, chroma in key color is used, if over tertiaryMinChroma.
    this.tertiaryChroma,
    this.tertiaryMinChroma = 0,
    // Default M3 hue rotation from primary, when now key with own hue given.
    this.tertiaryHueRotation = 60,
    // Defaults to null, chroma in key color is used, if over errorMinChroma and
    // a chroma key is given.
    this.errorChroma,
    this.errorMinChroma = 0,
    // Defaults to 4, chroma in key color is not used, fixed to 4.
    this.neutralChroma = 4,
    this.neutralMinChroma = 0,
    // Defaults to 8, chroma in key color is not used, fixed to 8.
    this.neutralVariantChroma = 8,
    this.neutralVariantMinChroma = 0,
  });

  const FlexTones.dark({
    this.primaryTone = 80,
    this.onPrimaryTone = 20,
    this.primaryContainerTone = 30,
    this.onPrimaryContainerTone = 90,
    this.secondaryTone = 80,
    this.onSecondaryTone = 20,
    this.secondaryContainerTone = 30,
    this.onSecondaryContainerTone = 90,
    this.tertiaryTone = 80,
    this.onTertiaryTone = 20,
    this.tertiaryContainerTone = 30,
    this.onTertiaryContainerTone = 90,
    this.errorTone = 80,
    this.onErrorTone = 20,
    this.errorContainerTone = 30,
    this.onErrorContainerTone = 80,
    this.backgroundTone = 10,
    this.onBackgroundTone = 90,
    this.surfaceTone = 10,
    this.onSurfaceTone = 90,
    this.surfaceVariantTone = 30,
    this.onSurfaceVariantTone = 80,
    this.outlineTone = 60,
    this.outlineVariantTone = 30,
    this.shadowTone = 0,
    this.scrimTone = 0,
    this.inverseSurfaceTone = 90,
    this.onInverseSurfaceTone = 20,
    this.inversePrimaryTone = 40,
    this.surfaceTintTone = 80,
    // Defaults to null, chroma in key color is used, if over primaryMinChroma.
    this.primaryChroma,
    this.primaryMinChroma = 48,
    // Defaults to null, chroma in key is used, if over secondaryMinChroma.
    this.secondaryChroma,
    this.secondaryMinChroma = 0,
    // Defaults to null, chroma in key color is used, if over tertiaryMinChroma.
    this.tertiaryChroma,
    this.tertiaryMinChroma = 0,
    // Default M3 hue rotation from primary, when now key with own hue given.
    this.tertiaryHueRotation = 60,
    // Defaults to null, chroma in key color is used, if over errorMinChroma.
    this.errorChroma,
    this.errorMinChroma = 0,
    // Defaults to 4, chroma in key color is not used, fixed to 4.
    this.neutralChroma = 4,
    this.neutralMinChroma = 0,
    // Defaults to 4, chroma in key color is not used, fixed to 8.
    // neutralVariantMinChroma.
    this.neutralVariantChroma = 8,
    this.neutralVariantMinChroma = 0,
  });

  factory FlexTones.material(Brightness brightness) =>
      brightness == Brightness.light
          ? const FlexTones.light(
              secondaryChroma: 16,
              tertiaryChroma: 24,
            )
          : const FlexTones.dark(
              secondaryChroma: 16,
              tertiaryChroma: 24,
            );

  factory FlexTones.soft(Brightness brightness) =>
      brightness == Brightness.light
          ? const FlexTones.light(
              primaryChroma: 30,
              primaryMinChroma: 0,
              secondaryChroma: 14,
              tertiaryChroma: 20,
            )
          : const FlexTones.dark(
              primaryChroma: 30,
              primaryMinChroma: 0,
              secondaryChroma: 14,
              tertiaryChroma: 20,
            );

  factory FlexTones.vivid(Brightness brightness) =>
      brightness == Brightness.light
          ? const FlexTones.light(
              primaryTone: 30,
              surfaceTintTone: 30,
              surfaceTone: 98,
              //
              primaryMinChroma: 50,
            )
          : const FlexTones.dark(
              onPrimaryTone: 10,
              primaryContainerTone: 20,
              backgroundTone: 5,
              //
              primaryMinChroma: 50,
            );

  factory FlexTones.vividSurfaces(Brightness brightness) =>
      brightness == Brightness.light
          ? const FlexTones.light(
              primaryTone: 30,
              onPrimaryTone: 98,
              onSecondaryTone: 98,
              onTertiaryTone: 98,
              onErrorTone: 98,
              surfaceTone: 95,
              onSurfaceVariantTone: 20,
              inverseSurfaceTone: 30,
              backgroundTone: 98,
              surfaceTintTone: 30,
              //
              primaryMinChroma: 50,
              neutralChroma: 5,
              neutralVariantChroma: 10,
            )
          : const FlexTones.dark(
              onPrimaryTone: 10,
              onSecondaryTone: 10,
              onTertiaryTone: 10,
              primaryContainerTone: 20,
              surfaceTone: 20,
              onSurfaceVariantTone: 95,
              inverseSurfaceTone: 95,
              //
              primaryMinChroma: 50,
              neutralChroma: 5,
              neutralVariantChroma: 10,
            );

  factory FlexTones.vividBackground(Brightness brightness) =>
      brightness == Brightness.light
          ? const FlexTones.light(
              primaryTone: 30,
              onPrimaryTone: 98,
              onSecondaryTone: 98,
              onTertiaryTone: 98,
              onErrorTone: 98,
              surfaceTone: 98,
              onSurfaceVariantTone: 20,
              inverseSurfaceTone: 30,
              backgroundTone: 95,
              surfaceTintTone: 30,
              //
              primaryMinChroma: 50,
              neutralChroma: 5,
              neutralVariantChroma: 10,
            )
          : const FlexTones.dark(
              onPrimaryTone: 10,
              onSecondaryTone: 10,
              onTertiaryTone: 10,
              primaryContainerTone: 20,
              backgroundTone: 20,
              onSurfaceVariantTone: 95,
              inverseSurfaceTone: 95,
              //
              primaryMinChroma: 50,
              neutralChroma: 5,
              neutralVariantChroma: 10,
            );

  factory FlexTones.highContrast(Brightness brightness) =>
      brightness == Brightness.light
          ? const FlexTones.light(
              primaryTone: 30,
              tertiaryTone: 30,
              primaryContainerTone: 95,
              secondaryContainerTone: 95,
              tertiaryContainerTone: 95,
              errorContainerTone: 95,
              surfaceTintTone: 30,
              //
              primaryMinChroma: 65,
              secondaryMinChroma: 55,
              tertiaryMinChroma: 55,
            )
          : const FlexTones.dark(
              onPrimaryTone: 10,
              onSecondaryTone: 10,
              onTertiaryTone: 10,
              onErrorTone: 10,
              primaryContainerTone: 20,
              secondaryContainerTone: 20,
              tertiaryContainerTone: 20,
              errorContainerTone: 20,
              onErrorContainerTone: 90,
              //
              primaryMinChroma: 65,
              secondaryMinChroma: 55,
              tertiaryMinChroma: 55,
            );

  factory FlexTones.ultraContrast(Brightness brightness) =>
      brightness == Brightness.light
          ? const FlexTones.light(
              primaryTone: 20,
              tertiaryTone: 30,
              onBackgroundTone: 0,
              onSurfaceTone: 0,
              primaryContainerTone: 95,
              secondaryContainerTone: 95,
              tertiaryContainerTone: 95,
              errorContainerTone: 95,
              onPrimaryContainerTone: 5,
              onSecondaryContainerTone: 5,
              onTertiaryContainerTone: 5,
              onErrorContainerTone: 5,
              surfaceVariantTone: 95,
              onSurfaceVariantTone: 10,
              onInverseSurfaceTone: 99,
              inversePrimaryTone: 90,
              outlineTone: 40,
              outlineVariantTone: 70,
              surfaceTintTone: 30,
              //
              primaryMinChroma: 60,
              secondaryMinChroma: 70,
              tertiaryMinChroma: 65,
              neutralChroma: 3,
              neutralVariantChroma: 6,
            )
          : const FlexTones.dark(
              primaryTone: 90,
              secondaryTone: 95,
              tertiaryTone: 95,
              onPrimaryTone: 5,
              onSecondaryTone: 5,
              onTertiaryTone: 5,
              onErrorTone: 5,
              onPrimaryContainerTone: 98,
              onSecondaryContainerTone: 98,
              onTertiaryContainerTone: 98,
              onErrorContainerTone: 98,
              //
              surfaceTone: 5,
              backgroundTone: 5,
              onBackgroundTone: 99,
              onSurfaceTone: 99,
              surfaceVariantTone: 20,
              onSurfaceVariantTone: 95,
              onInverseSurfaceTone: 10,
              outlineTone: 80,
              outlineVariantTone: 50,
              surfaceTintTone: 95,
              //
              primaryMinChroma: 60,
              secondaryMinChroma: 70,
              tertiaryMinChroma: 65,
              neutralChroma: 3,
              neutralVariantChroma: 6,
            );

  factory FlexTones.jolly(Brightness brightness) =>
      brightness == Brightness.light
          ? const FlexTones.light(
              primaryTone: 30,
              secondaryTone: 50,
              onPrimaryTone: 99,
              onSecondaryTone: 99,
              onTertiaryTone: 99,
              onErrorTone: 99,
              secondaryContainerTone: 95,
              surfaceTintTone: 30,
              //
              tertiaryChroma: 40,
              primaryMinChroma: 55,
              secondaryMinChroma: 40,
              neutralChroma: 6,
              neutralVariantChroma: 10,
            )
          : const FlexTones.dark(
              secondaryTone: 90,
              secondaryContainerTone: 20,
              onPrimaryTone: 10,
              onSecondaryTone: 10,
              onTertiaryTone: 10,
              onErrorTone: 10,
              //
              tertiaryChroma: 40,
              primaryMinChroma: 55,
              secondaryMinChroma: 40,
              neutralChroma: 6,
              neutralVariantChroma: 10,
            );

  factory FlexTones.oneHue(Brightness brightness) =>
      brightness == Brightness.light
          ? const FlexTones.light(
              secondaryContainerTone: 95,
              tertiaryTone: 30,
              tertiaryContainerTone: 80,
              //
              primaryMinChroma: 55,
              secondaryChroma: 26,
              tertiaryChroma: 36,
              tertiaryHueRotation: 0,
            )
          : const FlexTones.dark(
              tertiaryTone: 90,
              tertiaryContainerTone: 40,
              onTertiaryContainerTone: 95,
              //
              primaryMinChroma: 55,
              secondaryChroma: 26,
              tertiaryChroma: 36,
              tertiaryHueRotation: 0,
            );

  FlexTones onMainsUseBW([bool useBW = true]) {
    // ignore: avoid_returning_this
    if (!useBW) return this;
    return copyWith(
      onPrimaryTone: primaryTone <= 60 ? 100 : 0,
      onPrimaryContainerTone: primaryContainerTone <= 60 ? 100 : 0,
      onSecondaryTone: secondaryTone <= 60 ? 100 : 0,
      onSecondaryContainerTone: secondaryContainerTone <= 60 ? 100 : 0,
      onTertiaryTone: tertiaryTone <= 60 ? 100 : 0,
      onTertiaryContainerTone: tertiaryContainerTone <= 60 ? 100 : 0,
      onErrorTone: errorTone <= 60 ? 100 : 0,
      onErrorContainerTone: errorContainerTone <= 60 ? 100 : 0,
    );
  }

  FlexTones onSurfacesUseBW([bool useBW = true]) {
    // ignore: avoid_returning_this
    if (!useBW) return this;
    return copyWith(
      onBackgroundTone: backgroundTone <= 60 ? 100 : 0,
      onSurfaceTone: surfaceTone <= 60 ? 100 : 0,
      onSurfaceVariantTone: surfaceVariantTone <= 60 ? 100 : 0,
      onInverseSurfaceTone: inverseSurfaceTone <= 60 ? 100 : 0,
    );
  }

  final int primaryTone;
  final int onPrimaryTone;
  final int primaryContainerTone;
  final int onPrimaryContainerTone;
  final int secondaryTone;
  final int onSecondaryTone;
  final int secondaryContainerTone;
  final int onSecondaryContainerTone;
  final int tertiaryTone;
  final int onTertiaryTone;
  final int tertiaryContainerTone;
  final int onTertiaryContainerTone;
  final int errorTone;
  final int onErrorTone;
  final int errorContainerTone;
  final int onErrorContainerTone;
  final int backgroundTone;
  final int onBackgroundTone;
  final int surfaceTone;
  final int onSurfaceTone;
  final int surfaceVariantTone;
  final int onSurfaceVariantTone;
  final int outlineTone;
  final int outlineVariantTone;
  final int shadowTone;
  final int scrimTone;
  final int inverseSurfaceTone;
  final int onInverseSurfaceTone;
  final int inversePrimaryTone;
  final int surfaceTintTone;
  final double? primaryChroma;
  final double primaryMinChroma;
  final double? secondaryChroma;
  final double secondaryMinChroma;
  final double? tertiaryChroma;
  final double tertiaryMinChroma;
  final double tertiaryHueRotation;
  final double? errorChroma;
  final double errorMinChroma;
  final double? neutralChroma;
  final double neutralMinChroma;
  final double? neutralVariantChroma;
  final double neutralVariantMinChroma;

  FlexTones copyWith({
    int? primaryTone,
    int? onPrimaryTone,
    int? primaryContainerTone,
    int? onPrimaryContainerTone,
    int? secondaryTone,
    int? onSecondaryTone,
    int? secondaryContainerTone,
    int? onSecondaryContainerTone,
    int? tertiaryTone,
    int? onTertiaryTone,
    int? tertiaryContainerTone,
    int? onTertiaryContainerTone,
    int? errorTone,
    int? onErrorTone,
    int? errorContainerTone,
    int? onErrorContainerTone,
    int? backgroundTone,
    int? onBackgroundTone,
    int? surfaceTone,
    int? onSurfaceTone,
    int? surfaceVariantTone,
    int? onSurfaceVariantTone,
    int? outlineTone,
    int? outlineVariantTone,
    int? shadowTone,
    int? scrimTone,
    int? inverseSurfaceTone,
    int? onInverseSurfaceTone,
    int? inversePrimaryTone,
    int? surfaceTintTone,
    double? primaryChroma,
    double? primaryMinChroma,
    double? secondaryChroma,
    double? secondaryMinChroma,
    double? tertiaryChroma,
    double? tertiaryMinChroma,
    double? tertiaryHueRotation,
    double? errorChroma,
    double? errorMinChroma,
    double? neutralChroma,
    double? neutralMinChroma,
    double? neutralVariantChroma,
    double? neutralVariantMinChroma,
  }) {
    return FlexTones(
      primaryTone: primaryTone ?? this.primaryTone,
      onPrimaryTone: onPrimaryTone ?? this.onPrimaryTone,
      primaryContainerTone: primaryContainerTone ?? this.primaryContainerTone,
      onPrimaryContainerTone:
          onPrimaryContainerTone ?? this.onPrimaryContainerTone,
      secondaryTone: secondaryTone ?? this.secondaryTone,
      onSecondaryTone: onSecondaryTone ?? this.onSecondaryTone,
      secondaryContainerTone:
          secondaryContainerTone ?? this.secondaryContainerTone,
      onSecondaryContainerTone:
          onSecondaryContainerTone ?? this.onSecondaryContainerTone,
      tertiaryTone: tertiaryTone ?? this.tertiaryTone,
      onTertiaryTone: onTertiaryTone ?? this.onTertiaryTone,
      tertiaryContainerTone:
          tertiaryContainerTone ?? this.tertiaryContainerTone,
      onTertiaryContainerTone:
          onTertiaryContainerTone ?? this.onTertiaryContainerTone,
      errorTone: errorTone ?? this.errorTone,
      onErrorTone: onErrorTone ?? this.onErrorTone,
      errorContainerTone: errorContainerTone ?? this.errorContainerTone,
      onErrorContainerTone: onErrorContainerTone ?? this.onErrorContainerTone,
      backgroundTone: backgroundTone ?? this.backgroundTone,
      onBackgroundTone: onBackgroundTone ?? this.onBackgroundTone,
      surfaceTone: surfaceTone ?? this.surfaceTone,
      onSurfaceTone: onSurfaceTone ?? this.onSurfaceTone,
      surfaceVariantTone: surfaceVariantTone ?? this.surfaceVariantTone,
      onSurfaceVariantTone: onSurfaceVariantTone ?? this.onSurfaceVariantTone,
      outlineTone: outlineTone ?? this.outlineTone,
      outlineVariantTone: outlineVariantTone ?? this.outlineVariantTone,
      shadowTone: shadowTone ?? this.shadowTone,
      scrimTone: scrimTone ?? this.scrimTone,
      inverseSurfaceTone: inverseSurfaceTone ?? this.inverseSurfaceTone,
      onInverseSurfaceTone: onInverseSurfaceTone ?? this.onInverseSurfaceTone,
      inversePrimaryTone: inversePrimaryTone ?? this.inversePrimaryTone,
      surfaceTintTone: surfaceTintTone ?? this.surfaceTintTone,
      primaryChroma: primaryChroma ?? this.primaryChroma,
      primaryMinChroma: primaryMinChroma ?? this.primaryMinChroma,
      secondaryChroma: secondaryChroma ?? this.secondaryChroma,
      secondaryMinChroma: secondaryMinChroma ?? this.secondaryMinChroma,
      tertiaryChroma: tertiaryChroma ?? this.tertiaryChroma,
      tertiaryMinChroma: tertiaryMinChroma ?? this.tertiaryMinChroma,
      tertiaryHueRotation: tertiaryHueRotation ?? this.tertiaryHueRotation,
      errorChroma: errorChroma ?? this.errorChroma,
      errorMinChroma: errorMinChroma ?? this.errorMinChroma,
      neutralChroma: neutralChroma ?? this.neutralChroma,
      neutralMinChroma: neutralMinChroma ?? this.neutralMinChroma,
      neutralVariantChroma: neutralVariantChroma ?? this.neutralVariantChroma,
      neutralVariantMinChroma:
          neutralVariantMinChroma ?? this.neutralVariantMinChroma,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FlexTones &&
        other.primaryTone == primaryTone &&
        other.onPrimaryTone == onPrimaryTone &&
        other.primaryContainerTone == primaryContainerTone &&
        other.onPrimaryContainerTone == onPrimaryContainerTone &&
        other.secondaryTone == secondaryTone &&
        other.onSecondaryTone == onSecondaryTone &&
        other.secondaryContainerTone == secondaryContainerTone &&
        other.onSecondaryContainerTone == onSecondaryContainerTone &&
        other.tertiaryTone == tertiaryTone &&
        other.onTertiaryTone == onTertiaryTone &&
        other.tertiaryContainerTone == tertiaryContainerTone &&
        other.onTertiaryContainerTone == onTertiaryContainerTone &&
        other.errorTone == errorTone &&
        other.onErrorTone == onErrorTone &&
        other.errorContainerTone == errorContainerTone &&
        other.onErrorContainerTone == onErrorContainerTone &&
        other.backgroundTone == backgroundTone &&
        other.onBackgroundTone == onBackgroundTone &&
        other.surfaceTone == surfaceTone &&
        other.onSurfaceTone == onSurfaceTone &&
        other.surfaceVariantTone == surfaceVariantTone &&
        other.onSurfaceVariantTone == onSurfaceVariantTone &&
        other.outlineTone == outlineTone &&
        other.outlineVariantTone == outlineVariantTone &&
        other.shadowTone == shadowTone &&
        other.scrimTone == scrimTone &&
        other.inverseSurfaceTone == inverseSurfaceTone &&
        other.onInverseSurfaceTone == onInverseSurfaceTone &&
        other.inversePrimaryTone == inversePrimaryTone &&
        other.surfaceTintTone == surfaceTintTone &&
        other.primaryChroma == primaryChroma &&
        other.primaryMinChroma == primaryMinChroma &&
        other.secondaryChroma == secondaryChroma &&
        other.secondaryMinChroma == secondaryMinChroma &&
        other.tertiaryChroma == tertiaryChroma &&
        other.tertiaryMinChroma == tertiaryMinChroma &&
        other.tertiaryHueRotation == tertiaryHueRotation &&
        other.errorChroma == errorChroma &&
        other.errorMinChroma == errorMinChroma &&
        other.neutralChroma == neutralChroma &&
        other.neutralMinChroma == neutralMinChroma &&
        other.neutralVariantChroma == neutralVariantChroma &&
        other.neutralVariantMinChroma == neutralVariantMinChroma;
  }

  /// Override for hashcode, dart.ui Jenkins based.
  @override
  int get hashCode => Object.hashAll(<Object?>[
        primaryTone,
        onPrimaryTone,
        primaryContainerTone,
        onPrimaryContainerTone,
        secondaryTone,
        onSecondaryTone,
        secondaryContainerTone,
        onSecondaryContainerTone,
        tertiaryTone,
        onTertiaryTone,
        tertiaryContainerTone,
        onTertiaryContainerTone,
        errorTone,
        onErrorTone,
        errorContainerTone,
        onErrorContainerTone,
        backgroundTone,
        onBackgroundTone,
        surfaceTone,
        onSurfaceTone,
        surfaceVariantTone,
        onSurfaceVariantTone,
        outlineTone,
        outlineVariantTone,
        shadowTone,
        scrimTone,
        inverseSurfaceTone,
        onInverseSurfaceTone,
        inversePrimaryTone,
        surfaceTintTone,
        primaryChroma,
        primaryMinChroma,
        secondaryChroma,
        secondaryMinChroma,
        tertiaryChroma,
        tertiaryMinChroma,
        tertiaryHueRotation,
        errorChroma,
        errorMinChroma,
        neutralChroma,
        neutralMinChroma,
        neutralVariantChroma,
        neutralVariantMinChroma,
      ]);

  /// Flutter debug properties override, includes toString.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<int>('primaryTone', primaryTone));
    properties.add(DiagnosticsProperty<int>('onPrimaryTone', onPrimaryTone));
    properties.add(
        DiagnosticsProperty<int>('primaryContainerTone', primaryContainerTone));
    properties.add(DiagnosticsProperty<int>(
        'onPrimaryContainerTone', onPrimaryContainerTone));
    properties.add(DiagnosticsProperty<int>('secondaryTone', secondaryTone));
    properties
        .add(DiagnosticsProperty<int>('onSecondaryTone', onSecondaryTone));
    properties.add(DiagnosticsProperty<int>(
        'secondaryContainerTone', secondaryContainerTone));
    properties.add(DiagnosticsProperty<int>(
        'onSecondaryContainerTone', onSecondaryContainerTone));
    properties.add(DiagnosticsProperty<int>('tertiaryTone', tertiaryTone));
    properties.add(DiagnosticsProperty<int>('onTertiaryTone', onTertiaryTone));
    properties.add(DiagnosticsProperty<int>(
        'tertiaryContainerTone', tertiaryContainerTone));
    properties.add(DiagnosticsProperty<int>(
        'onTertiaryContainerTone', onTertiaryContainerTone));
    properties.add(DiagnosticsProperty<int>('errorTone', errorTone));
    properties.add(
        DiagnosticsProperty<int>('errorContainerTone', errorContainerTone));
    properties.add(
        DiagnosticsProperty<int>('onErrorContainerTone', onErrorContainerTone));
    properties.add(DiagnosticsProperty<int>('backgroundTone', backgroundTone));
    properties
        .add(DiagnosticsProperty<int>('onBackgroundTone', onBackgroundTone));
    properties.add(DiagnosticsProperty<int>('surfaceTone', surfaceTone));
    properties.add(DiagnosticsProperty<int>('onSurfaceTone', onSurfaceTone));
    properties.add(
        DiagnosticsProperty<int>('surfaceVariantTone', surfaceVariantTone));
    properties.add(
        DiagnosticsProperty<int>('onSurfaceVariantTone', onSurfaceVariantTone));
    properties.add(DiagnosticsProperty<int>('outlineTone', outlineTone));
    properties.add(
        DiagnosticsProperty<int>('outlineVariantTone', outlineVariantTone));
    properties.add(DiagnosticsProperty<int>('shadowTone', shadowTone));
    properties.add(DiagnosticsProperty<int>('scrimTone', scrimTone));
    properties.add(
        DiagnosticsProperty<int>('inverseSurfaceTone', inverseSurfaceTone));
    properties.add(
        DiagnosticsProperty<int>('onInverseSurfaceTone', onInverseSurfaceTone));
    properties.add(
        DiagnosticsProperty<int>('inversePrimaryTone', inversePrimaryTone));
    properties
        .add(DiagnosticsProperty<int>('surfaceTintTone', surfaceTintTone));
    properties.add(DiagnosticsProperty<double>('primaryChroma', primaryChroma));
    properties
        .add(DiagnosticsProperty<double>('primaryMinChroma', primaryMinChroma));
    properties
        .add(DiagnosticsProperty<double>('secondaryChroma', secondaryChroma));
    properties.add(
        DiagnosticsProperty<double>('secondaryMinChroma', secondaryMinChroma));
    properties
        .add(DiagnosticsProperty<double>('tertiaryChroma', tertiaryChroma));
    properties.add(DiagnosticsProperty<double>(
        'tertiaryHueRotation', tertiaryHueRotation));
    properties.add(
        DiagnosticsProperty<double>('tertiaryMinChroma', tertiaryMinChroma));
    properties.add(DiagnosticsProperty<double>('errorChroma', errorChroma));
    properties
        .add(DiagnosticsProperty<double>('errorMinChroma', errorMinChroma));
    properties.add(DiagnosticsProperty<double>('neutralChroma', neutralChroma));
    properties
        .add(DiagnosticsProperty<double>('neutralMinChroma', neutralMinChroma));
    properties.add(DiagnosticsProperty<double>(
        'neutralVariantChroma', neutralVariantChroma));
    properties.add(DiagnosticsProperty<double>(
        'neutralVariantMinChroma', neutralVariantMinChroma));
  }
}
