import 'package:flutter/cupertino.dart';

@protected
class ResourcesAlertDialog {
  /// Whether dialog can dismiss by touching outside or not
  bool barrierDismissible = true;

  /// This function will trigger when user dismisses dialog
  Function? onDismissListener;

  /// This function will trigger when user click to button positive
  Function? onPositiveListener;

  /// This function will trigger when user click to button negative
  Function? onNegativeListener;

  /// Title of dialog
  String? titleHeader;
  String? description;
  String? titlePositive;
  String? titleNegative;

  /// CustomDialog's background color
  Color? backgroundColor;

  /// Duration of blur and background color animation
  Duration? animationDuration;
}
