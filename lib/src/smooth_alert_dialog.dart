import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:smooth_dialog/src/config/dialog_config.dart';
import 'package:smooth_dialog/src/dialog_controller.dart';

/// A smooth, platform-aware alert dialog with easy-to-use API
class SmoothAlertDialog {
  SmoothAlertDialog._();

  /// Shows an alert dialog with the specified parameters
  ///
  /// Returns a Future that resolves when the dialog is dismissed
  ///
  /// Button text and actions are combined in [DialogButton] objects.
  ///
  /// Example:
  /// ```dart
  /// await SmoothAlertDialog.show(
  ///   context: context,
  ///   title: 'Confirm Action',
  ///   content: 'Are you sure you want to continue?',
  ///   positiveButton: DialogButton(
  ///     text: 'Yes',
  ///     onPressed: (dialog) {
  ///       dialog.dismiss();
  ///       print('Confirmed');
  ///     },
  ///   ),
  ///   negativeButton: DialogButton(
  ///     text: 'No',
  ///     onPressed: (dialog) => dialog.dismiss(),
  ///   ),
  /// );
  /// ```
  static Future<T?> show<T>({
    required BuildContext context,
    String? title,
    String? content,
    Widget? titleWidget,
    Widget? contentWidget,
    DialogButton? positiveButton,
    DialogButton? negativeButton,
    VoidCallback? onDismissed,
    SmoothDialogConfig? config,
  }) {
    final effectiveConfig = config ?? const SmoothDialogConfig();

    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: effectiveConfig.barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: effectiveConfig.animationDuration,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.95, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                curve: effectiveConfig.animationCurve,
              ),
            ),
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return _buildPlatformDialog(
          context: context,
          title: title,
          content: content,
          titleWidget: titleWidget,
          contentWidget: contentWidget,
          positiveButton: positiveButton,
          negativeButton: negativeButton,
          onDismissed: onDismissed,
          config: effectiveConfig,
        );
      },
    ).then((value) {
      onDismissed?.call();
      return value;
    });
  }

  static Widget _buildPlatformDialog({
    required BuildContext context,
    required String? title,
    required String? content,
    required Widget? titleWidget,
    required Widget? contentWidget,
    required DialogButton? positiveButton,
    required DialogButton? negativeButton,
    required VoidCallback? onDismissed,
    required SmoothDialogConfig config,
  }) {
    if (kIsWeb || (!Platform.isIOS && !Platform.isMacOS)) {
      return _buildMaterialDialog(
        context: context,
        title: title,
        content: content,
        titleWidget: titleWidget,
        contentWidget: contentWidget,
        positiveButton: positiveButton,
        negativeButton: negativeButton,
        config: config,
      );
    } else {
      return _buildCupertinoDialog(
        context: context,
        title: title,
        content: content,
        titleWidget: titleWidget,
        contentWidget: contentWidget,
        positiveButton: positiveButton,
        negativeButton: negativeButton,
        config: config,
      );
    }
  }

  static Widget _buildMaterialDialog({
    required BuildContext context,
    required String? title,
    required String? content,
    required Widget? titleWidget,
    required Widget? contentWidget,
    required DialogButton? positiveButton,
    required DialogButton? negativeButton,
    required SmoothDialogConfig config,
  }) {
    final theme = Theme.of(context);

    Widget? effectiveTitleWidget;
    if (titleWidget != null) {
      effectiveTitleWidget = titleWidget;
    } else if (title != null) {
      effectiveTitleWidget = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (config.icon != null) ...[
            config.icon!,
            const SizedBox(height: 16),
          ],
          Text(title, style: config.titleStyle ?? theme.textTheme.titleLarge),
        ],
      );
    }

    Widget? effectiveContentWidget;
    if (contentWidget != null) {
      effectiveContentWidget = contentWidget;
    } else if (content != null) {
      effectiveContentWidget = Text(
        content,
        style: config.contentStyle ?? theme.textTheme.bodyMedium,
      );
    }

    return AlertDialog(
      backgroundColor: config.backgroundColor,
      elevation: config.elevation,
      shape: config.shape,
      title: effectiveTitleWidget,
      content: effectiveContentWidget,
      actionsPadding: const EdgeInsets.only(right: 16, bottom: 8),
      contentPadding: const EdgeInsets.only(top: 16,bottom: 16, left: 24, right: 24),
      actions: _buildActions(
        context: context,
        positiveButton: positiveButton,
        negativeButton: negativeButton,
        config: config,
        isCupertino: false,
      ),
    );
  }

  static Widget _buildCupertinoDialog({
    required BuildContext context,
    required String? title,
    required String? content,
    required Widget? titleWidget,
    required Widget? contentWidget,
    required DialogButton? positiveButton,
    required DialogButton? negativeButton,
    required SmoothDialogConfig config,
  }) {
    Widget? effectiveTitleWidget;
    if (titleWidget != null) {
      effectiveTitleWidget = titleWidget;
    } else if (title != null) {
      effectiveTitleWidget = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (config.icon != null) ...[config.icon!, const SizedBox(height: 8)],
          Text(title, style: config.titleStyle),
        ],
      );
    }

    Widget? effectiveContentWidget;
    if (contentWidget != null) {
      effectiveContentWidget = contentWidget;
    } else if (content != null) {
      effectiveContentWidget = Text(content, style: config.contentStyle);
    }

    return CupertinoAlertDialog(
      title: effectiveTitleWidget,
      content: effectiveContentWidget,
      actions: _buildActions(
        context: context,
        positiveButton: positiveButton,
        negativeButton: negativeButton,
        config: config,
        isCupertino: true,
      ),
    );
  }

  static List<Widget> _buildActions({
    required BuildContext context,
    required DialogButton? positiveButton,
    required DialogButton? negativeButton,
    required SmoothDialogConfig config,
    required bool isCupertino,
  }) {
    final actions = <Widget>[];
    final dialogController = SmoothDialogController(context);

    if (negativeButton != null) {
      if (isCupertino) {
        actions.add(
          CupertinoDialogAction(
            onPressed: () => negativeButton.onPressed(dialogController),
            child: Text(negativeButton.text, style: config.negativeButtonStyle),
          ),
        );
      } else {
        actions.add(
          TextButton(
            onPressed: () => negativeButton.onPressed(dialogController),
            child: Text(negativeButton.text, style: config.negativeButtonStyle),
          ),
        );
      }
    }

    // Always show positive button with default 'OK' text if not provided
    final effectivePositiveButton =
        positiveButton ??
        DialogButton(text: 'OK', onPressed: (dialog) => dialog.dismiss());

    if (isCupertino) {
      actions.add(
        CupertinoDialogAction(
          onPressed: () => effectivePositiveButton.onPressed(dialogController),
          child: Text(
            effectivePositiveButton.text,
            style: config.positiveButtonStyle,
          ),
        ),
      );
    } else {
      actions.add(
        TextButton(
          onPressed: () => effectivePositiveButton.onPressed(dialogController),
          child: Text(
            effectivePositiveButton.text,
            style: config.positiveButtonStyle,
          ),
        ),
      );
    }

    return actions;
  }
}
