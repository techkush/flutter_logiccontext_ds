import 'package:flutter/material.dart';

const shape = Color(0xFF007399);
const surface = Color(0xFF5442E9);

// Theme.of(context).extension<CustomColors>()?.onShape

CustomColors lightCustomColors = const CustomColors(
  sourceShape: Color(0xFF007399),
  shape: Color(0xFF006688),
  onShape: Color(0xFFFFFFFF),
  shapeContainer: Color(0xFFC2E8FF),
  onShapeContainer: Color(0xFF001E2B),
  sourceSurface: Color(0xFF5442E9),
  surface: Color(0xFF5240E7),
  onSurface: Color(0xFFFFFFFF),
  surfaceContainer: Color(0xFFE3DFFF),
  onSurfaceContainer: Color(0xFF130067),
);

CustomColors darkCustomColors = const CustomColors(
  sourceShape: Color(0xFF007399),
  shape: Color(0xFF76D1FF),
  onShape: Color(0xFF003548),
  shapeContainer: Color(0xFF004D67),
  onShapeContainer: Color(0xFFC2E8FF),
  sourceSurface: Color(0xFF5442E9),
  surface: Color(0xFFC5C0FF),
  onSurface: Color(0xFF2400A2),
  surfaceContainer: Color(0xFF391BD0),
  onSurfaceContainer: Color(0xFFE3DFFF),
);

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceShape,
    required this.shape,
    required this.onShape,
    required this.shapeContainer,
    required this.onShapeContainer,
    required this.sourceSurface,
    required this.surface,
    required this.onSurface,
    required this.surfaceContainer,
    required this.onSurfaceContainer,
  });

  final Color? sourceShape;
  final Color? shape;
  final Color? onShape;
  final Color? shapeContainer;
  final Color? onShapeContainer;
  final Color? sourceSurface;
  final Color? surface;
  final Color? onSurface;
  final Color? surfaceContainer;
  final Color? onSurfaceContainer;

  @override
  CustomColors copyWith({
    Color? sourceShape,
    Color? shape,
    Color? onShape,
    Color? shapeContainer,
    Color? onShapeContainer,
    Color? sourceSurface,
    Color? surface,
    Color? onSurface,
    Color? surfaceContainer,
    Color? onSurfaceContainer,
  }) {
    return CustomColors(
      sourceShape: sourceShape ?? this.sourceShape,
      shape: shape ?? this.shape,
      onShape: onShape ?? this.onShape,
      shapeContainer: shapeContainer ?? this.shapeContainer,
      onShapeContainer: onShapeContainer ?? this.onShapeContainer,
      sourceSurface: sourceSurface ?? this.sourceSurface,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      onSurfaceContainer: onSurfaceContainer ?? this.onSurfaceContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceShape: Color.lerp(sourceShape, other.sourceShape, t),
      shape: Color.lerp(shape, other.shape, t),
      onShape: Color.lerp(onShape, other.onShape, t),
      shapeContainer: Color.lerp(shapeContainer, other.shapeContainer, t),
      onShapeContainer: Color.lerp(onShapeContainer, other.onShapeContainer, t),
      sourceSurface: Color.lerp(sourceSurface, other.sourceSurface, t),
      surface: Color.lerp(surface, other.surface, t),
      onSurface: Color.lerp(onSurface, other.onSurface, t),
      surfaceContainer: Color.lerp(surfaceContainer, other.surfaceContainer, t),
      onSurfaceContainer: Color.lerp(onSurfaceContainer, other.onSurfaceContainer, t),
    );
  }

  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith(
    );
  }
}