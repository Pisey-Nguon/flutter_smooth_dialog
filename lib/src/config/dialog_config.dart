import 'package:flutter/material.dart';

/// Configuration class for alert dialog customization
class SmoothDialogConfig {
  const SmoothDialogConfig({
    this.backgroundColor,
    this.titleStyle,
    this.contentStyle,
    this.positiveButtonStyle,
    this.negativeButtonStyle,
    this.barrierDismissible = true,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeOut,
    this.elevation,
    this.shape,
    this.icon,
  });

  /// Background color of the dialog
  final Color? backgroundColor;

  /// Style for the title text
  final TextStyle? titleStyle;

  /// Style for the content/description text
  final TextStyle? contentStyle;

  /// Style for the positive button text
  final TextStyle? positiveButtonStyle;

  /// Style for the negative button text
  final TextStyle? negativeButtonStyle;

  /// Whether the dialog can be dismissed by tapping outside
  final bool barrierDismissible;

  /// Duration of the dialog animation
  final Duration animationDuration;

  /// Animation curve for the dialog
  final Curve animationCurve;

  /// Elevation of the dialog
  final double? elevation;

  /// Shape of the dialog
  final ShapeBorder? shape;

  /// Optional icon to display at the top of the dialog
  final Widget? icon;

  /// Creates a copy with overridden values
  SmoothDialogConfig copyWith({
    Color? backgroundColor,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    TextStyle? positiveButtonStyle,
    TextStyle? negativeButtonStyle,
    bool? barrierDismissible,
    Duration? animationDuration,
    Curve? animationCurve,
    double? elevation,
    ShapeBorder? shape,
    Widget? icon,
  }) {
    return SmoothDialogConfig(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleStyle: titleStyle ?? this.titleStyle,
      contentStyle: contentStyle ?? this.contentStyle,
      positiveButtonStyle: positiveButtonStyle ?? this.positiveButtonStyle,
      negativeButtonStyle: negativeButtonStyle ?? this.negativeButtonStyle,
      barrierDismissible: barrierDismissible ?? this.barrierDismissible,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      elevation: elevation ?? this.elevation,
      shape: shape ?? this.shape,
      icon: icon ?? this.icon,
    );
  }
}

/// Configuration class for loading dialog customization
class SmoothLoadingConfig {
  const SmoothLoadingConfig({
    this.backgroundColor,
    this.indicatorColor,
    this.textStyle,
    this.barrierDismissible = false,
    this.animationDuration = const Duration(milliseconds: 300),
    this.size = 80.0,
    this.indicatorSize = 40.0,
    this.customIndicator,
  });

  /// Background color of the loading container
  final Color? backgroundColor;

  /// Color of the loading indicator
  final Color? indicatorColor;

  /// Style for the loading text
  final TextStyle? textStyle;

  /// Whether the loading dialog can be dismissed by tapping outside
  final bool barrierDismissible;

  /// Duration of the dialog animation
  final Duration animationDuration;

  /// Size of the loading container
  final double size;

  /// Size of the loading indicator
  final double indicatorSize;

  /// Custom loading indicator widget
  final Widget? customIndicator;

  /// Creates a copy with overridden values
  SmoothLoadingConfig copyWith({
    Color? backgroundColor,
    Color? indicatorColor,
    TextStyle? textStyle,
    bool? barrierDismissible,
    Duration? animationDuration,
    double? size,
    double? indicatorSize,
    Widget? customIndicator,
  }) {
    return SmoothLoadingConfig(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      textStyle: textStyle ?? this.textStyle,
      barrierDismissible: barrierDismissible ?? this.barrierDismissible,
      animationDuration: animationDuration ?? this.animationDuration,
      size: size ?? this.size,
      indicatorSize: indicatorSize ?? this.indicatorSize,
      customIndicator: customIndicator ?? this.customIndicator,
    );
  }
}
