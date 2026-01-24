import 'package:flutter/material.dart';
import 'package:smooth_dialog/src/config/dialog_config.dart';
import 'package:smooth_dialog/src/smooth_alert_dialog.dart';
import 'package:smooth_dialog/src/smooth_loading_dialog.dart';
import 'package:smooth_dialog/src/dialog_controller.dart';

/// Legacy API for backward compatibility with v0.0.4
///
/// **DEPRECATED**: This class is provided for backward compatibility only.
/// Please migrate to the new API using [SmoothAlertDialog] and [SmoothLoadingDialog].
///
/// Migration example:
/// ```dart
/// // Old API
/// final dialog = SmoothDialog(context);
/// dialog.setTitleHeader("Title")
///       .setDescription("Description")
///       .showDialog();
///
/// // New API
/// SmoothAlertDialog.show(
///   context: context,
///   title: "Title",
///   content: "Description",
/// );
/// ```
@Deprecated(
  'Use SmoothAlertDialog.show() instead. This will be removed in v2.0.0',
)
class SmoothDialog {
  final BuildContext _context;

  String? _title;
  String? _description;
  Function? _onPositiveListener;
  Function? _onNegativeListener;
  String? _positiveButtonText;
  String? _negativeButtonText;
  VoidCallback? _onDismissed;
  bool _barrierDismissible = true;
  String? _loadingMessage;

  SmoothDialog(this._context);

  @Deprecated('Use SmoothAlertDialog.show() with title parameter')
  SmoothDialog setTitleHeader(String titleHeader) {
    _title = titleHeader;
    return this;
  }

  @Deprecated('Use SmoothAlertDialog.show() with content parameter')
  SmoothDialog setDescription(String description) {
    _description = description;
    return this;
  }

  @Deprecated('Use SmoothAlertDialog.show() with positiveButton parameter')
  SmoothDialog setTitlePositive(String titlePositive) {
    _positiveButtonText = titlePositive;
    return this;
  }

  @Deprecated('Use SmoothAlertDialog.show() with negativeButton parameter')
  SmoothDialog setTitleNegative(String titleNegative) {
    _negativeButtonText = titleNegative;
    return this;
  }

  @Deprecated('Use SmoothAlertDialog.show() with positiveButton parameter')
  SmoothDialog addButtonPositiveListener(Function onPositiveListener) {
    _onPositiveListener = onPositiveListener;
    return this;
  }

  @Deprecated('Use SmoothAlertDialog.show() with negativeButton parameter')
  SmoothDialog addButtonNegativeListener(Function onNegativeListener) {
    _onNegativeListener = onNegativeListener;
    return this;
  }

  @Deprecated('Use SmoothAlertDialog.show() with onDismissed parameter')
  SmoothDialog addDismissListener(Function onDismissListener) {
    _onDismissed = () => onDismissListener();
    return this;
  }

  @Deprecated('Use SmoothDialogConfig(barrierDismissible: false)')
  SmoothDialog setBarrierDismissible(bool barrierDismissible) {
    _barrierDismissible = barrierDismissible;
    return this;
  }

  @Deprecated('Use SmoothLoadingDialog.show() with message parameter')
  SmoothDialog setTitleLoading(String title) {
    _loadingMessage = title;
    return this;
  }

  @Deprecated('Use SmoothAlertDialog.show()')
  void showDialog() {
    DialogButton? positiveButton;
    if (_positiveButtonText != null || _onPositiveListener != null) {
      positiveButton = DialogButton(
        text: _positiveButtonText ?? 'OK',
        onPressed: (dialog) {
          dialog.dismiss();
          _onPositiveListener?.call();
        },
      );
    }

    DialogButton? negativeButton;
    if (_negativeButtonText != null && _onNegativeListener != null) {
      negativeButton = DialogButton(
        text: _negativeButtonText!,
        onPressed: (dialog) {
          dialog.dismiss();
          _onNegativeListener!();
        },
      );
    }

    SmoothAlertDialog.show(
      context: _context,
      title: _title,
      content: _description,
      positiveButton: positiveButton,
      negativeButton: negativeButton,
      onDismissed: _onDismissed,
      config: SmoothDialogConfig(barrierDismissible: _barrierDismissible),
    );
  }

  @Deprecated('Dialog auto-dismisses when buttons are pressed')
  void dismissDialog() {
    Navigator.of(_context).pop();
  }

  @Deprecated('Use SmoothLoadingDialog.show()')
  void showLoadingDialog() {
    SmoothLoadingDialog.show(context: _context, message: _loadingMessage);
  }

  @Deprecated('Use SmoothLoadingDialog.dismiss()')
  void dismissLoading() {
    SmoothLoadingDialog.dismiss();
  }
}
