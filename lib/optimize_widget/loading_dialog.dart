import 'package:flutter/material.dart';
import 'package:smooth_dialog/resources/resources_loading_dialog.dart';

import 'custom_dialog.dart';

class LoadingDialog {
  final BuildContext context;
  final ResourcesLoadingDialog resourcesLoadingDialog;

  LoadingDialog(this.context, this.resourcesLoadingDialog);

  bool _isShowing = false;

  /// Show progress dialog
  void show() {
    if (!_isShowing) {
      _isShowing = true;
      showGeneralDialog(
          context: context,
          barrierDismissible: resourcesLoadingDialog.barrierDismissible,
          barrierLabel: "",
          pageBuilder: (context, anim1, anim2) {
            return _getDialogWidget();
          },
          transitionBuilder: (context, anim1, anim2, child) {
            return FadeTransition(
              opacity: anim1,
              child: child,
            );
          },
          transitionDuration: resourcesLoadingDialog.animationDuration != null
              ? resourcesLoadingDialog.animationDuration!
              : const Duration(milliseconds: 300));
      _isShowing = false;
    }
  }

  /// Dismiss progress dialog
  void dismiss() {
    if (_isShowing) {
      _isShowing = false;
      Navigator.pop(context);
    }
  }

  Widget _getDialogWidget() {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.95, end: 1),
        duration: resourcesLoadingDialog.animationDuration != null
            ? resourcesLoadingDialog.animationDuration!
            : const Duration(milliseconds: 200),
        builder: (context, double val, child) {
          return Transform.scale(
            scale: val,
            child: _androidDialog(),
          );
        });
  }

  Widget _androidDialog() {
    final loading = Container(
      padding: const EdgeInsets.all(10.0),
      height: resourcesLoadingDialog.titleLoading != null ? 100.0 : 80.0,
      width: resourcesLoadingDialog.titleLoading != null ? 100.0 : 80.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
          ),
          if (resourcesLoadingDialog.titleLoading != null)
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  resourcesLoadingDialog.titleLoading!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87),
                  textAlign: TextAlign.center,
                ))
        ],
      ),
    );

    return CustomDialog(
      backgroundColor: Colors.transparent,
      child: loading,
    );
  }
}
