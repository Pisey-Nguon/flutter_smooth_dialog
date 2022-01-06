import 'dart:ui';

class ResourcesLoadingDialog {
  /// Whether dialog can dismiss by touching outside or not
  bool barrierDismissible = true;

  /// This function will trigger when user dismisses dialog
  Function? onDismissListener;

  /// Title of dialog
  String? titleLoading;

  /// CustomDialog's background color
  Color? backgroundColor;

  /// Duration of blur and background color animation
  Duration? animationDuration;
}
