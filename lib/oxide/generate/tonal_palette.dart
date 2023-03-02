import 'dart:math' as math;
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:meta/meta.dart' show immutable;

@immutable
class FlexTonalPalette {

  static const List<int> commonTones = <int>[
    0,
    5,
    10,
    20,
    30,
    40,
    50,
    60,
    70,
    80,
    90,
    95,
    98,
    99,
    100,
  ];

  static const int commonSize = 15;

  final double? _hue;
  final double? _chroma;
  final Map<int, int> _cache;

  FlexTonalPalette._fromHueAndChroma(double hue, double chroma)
      : _cache = <int, int>{},
        _hue = hue,
        _chroma = chroma;

  const FlexTonalPalette._fromCache(Map<int, int> cache)
      : _cache = cache,
        _hue = null,
        _chroma = null;

  static FlexTonalPalette of(double hue, double chroma) {
    return FlexTonalPalette._fromHueAndChroma(hue, chroma);
  }

  static FlexTonalPalette fromList(List<int> colors) {
    assert(colors.length == commonSize, 'Length must be $commonSize');
    Map<int, int> cache;
    cache = <int, int>{};
    commonTones.asMap().forEach(
        (int index, int toneValue) => cache[toneValue] = colors[index]);
    return FlexTonalPalette._fromCache(cache);
  }

  List<int> get asList => commonTones.map(get).toList();
  int get(int tone) {
    if (_hue == null || _chroma == null) {
      if (!_cache.containsKey(tone)) {
        throw ArgumentError.value(
          tone,
          'tone',
          'When a FlexTonalPalette is created with fromList, tone must be '
              'one of $commonTones',
        );
      } else {
        return _cache[tone]!;
      }
    }
    final double chroma = (tone >= 90.0) ? math.min(_chroma!, 40.0) : _chroma!;
    return _cache.putIfAbsent(
        tone, () => Hct.from(_hue!, chroma, tone.toDouble()).toInt());
  }

  @override
  bool operator ==(Object other) {
    if (other is FlexTonalPalette) {
      if (_hue != null && _chroma != null) {
        return _hue == other._hue && _chroma == other._chroma;
      } else {
        return _cache.values.toSet().containsAll(other._cache.values);
      }
    }
    return false;
  }

  @override
  int get hashCode =>
      Object.hash(_hue, _chroma) ^ Object.hashAll(_cache.values);

  @override
  String toString() {
    if (_hue != null && _chroma != null) {
      return 'FlexTonalPalette.of($_hue, $_chroma)';
    } else {
      return 'FlexTonalPalette.fromList($_cache)';
    }
  }
}

@immutable
class FlexCorePalette {
  const FlexCorePalette({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.neutral,
    required this.neutralVariant,
    FlexTonalPalette? error,
  }) : _error = error;

  static const int size = 6;
  final FlexTonalPalette primary;
  final FlexTonalPalette secondary;
  final FlexTonalPalette tertiary;
  final FlexTonalPalette neutral;
  final FlexTonalPalette neutralVariant;
  final FlexTonalPalette? _error;
  FlexTonalPalette get error => _error ?? FlexTonalPalette.of(25, 84);

  static FlexCorePalette of(int argb) {
    final Cam16 cam = Cam16.fromInt(argb);
    return FlexCorePalette.fromHueChroma(cam.hue, cam.chroma);
  }

  FlexCorePalette.fromHueChroma(double hue, double chroma)
      : primary = FlexTonalPalette.of(hue, math.max(48, chroma)),
        secondary = FlexTonalPalette.of(hue, 16),
        tertiary = FlexTonalPalette.of(hue + 60, 24),
        neutral = FlexTonalPalette.of(hue, 4),
        neutralVariant = FlexTonalPalette.of(hue, 8),
        _error = FlexTonalPalette.of(25, 84);

  factory FlexCorePalette.fromSeeds({
    required int primary,
    int? secondary,
    int? tertiary,
    int? error,
    int? neutral,
    int? neutralVariant,
    final double? primaryChroma,
    final double primaryMinChroma = 48,
    final double? secondaryChroma,
    final double secondaryMinChroma = 0,
    final double? tertiaryChroma,
    final double tertiaryMinChroma = 0,
    final double tertiaryHueRotation = 60,
    final double? neutralChroma = 4,
    final double neutralMinChroma = 0,
    final double? neutralVariantChroma = 8,
    final double neutralVariantMinChroma = 0,
    final double? errorChroma,
    final double errorMinChroma = 0,
  }) {

    final Cam16 camPrimary = Cam16.fromInt(primary);
    final double effectivePrimaryChroma = primaryChroma ?? camPrimary.chroma;
    final FlexTonalPalette tonalPrimary = FlexTonalPalette.of(
        camPrimary.hue, math.max(primaryMinChroma, effectivePrimaryChroma));

    final Cam16 camSecondary =
        secondary == null ? camPrimary : Cam16.fromInt(secondary);
    final double effectiveSecondaryChroma =
        secondaryChroma ?? camSecondary.chroma;
    final FlexTonalPalette tonalSecondary = FlexTonalPalette.of(
        camSecondary.hue,
        math.max(secondaryMinChroma, effectiveSecondaryChroma));

    final Cam16 camTertiary =
        tertiary == null ? camPrimary : Cam16.fromInt(tertiary);
    final double effectiveTertiaryChroma = tertiaryChroma ?? camTertiary.chroma;
    final double effectiveTertiaryHue = tertiary == null
        ? camPrimary.hue + tertiaryHueRotation
        : camTertiary.hue;
    final FlexTonalPalette tonalTertiary = FlexTonalPalette.of(
        effectiveTertiaryHue,
        math.max(tertiaryMinChroma, effectiveTertiaryChroma));

    final Cam16 camNeutral =
        neutral == null ? camPrimary : Cam16.fromInt(neutral);
    final double effectiveNeutralChroma = neutralChroma ?? camNeutral.chroma;
    final FlexTonalPalette tonalNeutral = FlexTonalPalette.of(
        camNeutral.hue, math.max(neutralMinChroma, effectiveNeutralChroma));

    final Cam16 camNeutralVariant =
        neutralVariant == null ? camPrimary : Cam16.fromInt(neutralVariant);
    final double effectiveNeutralVariantChroma =
        neutralVariantChroma ?? camNeutralVariant.chroma;
    final FlexTonalPalette tonalNeutralVariant = FlexTonalPalette.of(
        camNeutralVariant.hue,
        math.max(neutralVariantMinChroma, effectiveNeutralVariantChroma));

    final Cam16 camError =
        error == null ? Cam16.fromInt(0xFFDE3730) : Cam16.fromInt(error);
    final double effectiveErrorChroma = errorChroma ?? camError.chroma;
    final FlexTonalPalette? tonalError = (error == null && errorChroma == null)
        ? null
        : FlexTonalPalette.of(
            camError.hue, math.max(errorMinChroma, effectiveErrorChroma));

    return FlexCorePalette(
      primary: tonalPrimary,
      secondary: tonalSecondary,
      tertiary: tonalTertiary,
      neutral: tonalNeutral,
      neutralVariant: tonalNeutralVariant,
      error: tonalError,
    );
  }

  FlexCorePalette.fromList(List<int> colors)
      : assert(colors.length == size * FlexTonalPalette.commonSize,
            'Incorrect size.'),
        primary = FlexTonalPalette.fromList(
            _getPartition(colors, 0, FlexTonalPalette.commonSize)),
        secondary = FlexTonalPalette.fromList(
            _getPartition(colors, 1, FlexTonalPalette.commonSize)),
        tertiary = FlexTonalPalette.fromList(
            _getPartition(colors, 2, FlexTonalPalette.commonSize)),
        neutral = FlexTonalPalette.fromList(
            _getPartition(colors, 3, FlexTonalPalette.commonSize)),
        neutralVariant = FlexTonalPalette.fromList(
            _getPartition(colors, 4, FlexTonalPalette.commonSize)),
        _error = FlexTonalPalette.fromList(
            _getPartition(colors, 5, FlexTonalPalette.commonSize));

  List<int> asList() => <int>[
        ...primary.asList,
        ...secondary.asList,
        ...tertiary.asList,
        ...neutral.asList,
        ...neutralVariant.asList,
        ...error.asList,
      ];

  @override
  bool operator ==(Object other) =>
      other is FlexCorePalette &&
      primary == other.primary &&
      secondary == other.secondary &&
      tertiary == other.tertiary &&
      neutral == other.neutral &&
      neutralVariant == other.neutralVariant &&
      error == other.error;

  @override
  int get hashCode => Object.hashAll(<Object?>[
        primary,
        secondary,
        tertiary,
        neutral,
        neutralVariant,
        error,
      ]);

  @override
  String toString() {
    return 'primary: $primary\n'
        'secondary: $secondary\n'
        'tertiary: $tertiary\n'
        'neutral: $neutral\n'
        'neutralVariant: $neutralVariant\n'
        'error: $error\n';
  }

  static List<int> _getPartition(
      List<int> list, int partitionNumber, int partitionSize) {
    return list.sublist(
      partitionNumber * partitionSize,
      (partitionNumber + 1) * partitionSize,
    );
  }
}
