library easy_dialog;

import 'package:flutter/material.dart';
import 'package:smooth_dialog/controller/loading_dialog_base.dart';
import 'package:smooth_dialog/optimize_widget/loading_dialog.dart';
import 'package:smooth_dialog/resources/resources_alert_dialog.dart';
import 'package:smooth_dialog/resources/resources_loading_dialog.dart';

import 'controller/alert_dialog_base.dart';
import 'optimize_widget/anim_dialog.dart';

class SmoothDialog extends AlertDialogBase with LoadingDialogBase {
  @protected
  final BuildContext _context;

  SmoothDialog(this._context);
  AnimDialog? _animDialog;
  LoadingDialog? _loadingDialog;
  final ResourcesAlertDialog _resourcesDialog = ResourcesAlertDialog();
  final ResourcesLoadingDialog _resourcesLoadingDialog =
      ResourcesLoadingDialog();

  @override
  void showDialog() {
    _animDialog = AnimDialog(_context, _resourcesDialog);
    _animDialog?.show();
  }

  @override
  void dismissDialog() {
    _animDialog?.dismiss();
  }

  @override
  AlertDialogBase setDescription(String description) {
    _resourcesDialog.description = description;
    return this;
  }

  @override
  AlertDialogBase setTitleHeader(String titleHeader) {
    _resourcesDialog.titleHeader = titleHeader;
    return this;
  }

  @override
  AlertDialogBase setTitleNegative(String titleNegative) {
    _resourcesDialog.titleNegative = titleNegative;
    return this;
  }

  @override
  AlertDialogBase setTitlePositive(String titlePositive) {
    _resourcesDialog.titlePositive = titlePositive;
    return this;
  }

  @override
  AlertDialogBase addButtonNegativeListener(Function onNegativeListener) {
    _resourcesDialog.onNegativeListener = onNegativeListener;
    return this;
  }

  @override
  AlertDialogBase addButtonPositiveListener(Function onPositiveListener) {
    _resourcesDialog.onPositiveListener = onPositiveListener;
    return this;
  }

  @override
  AlertDialogBase setBarrierDismissible(bool barrierDismissible) {
    _resourcesDialog.barrierDismissible = barrierDismissible;
    return this;
  }

  @override
  AlertDialogBase addDismissListener(Function onDismissListener) {
    _resourcesDialog.onDismissListener = onDismissListener;
    return this;
  }

  @override
  LoadingDialogBase setTitleLoading(String title) {
    _resourcesLoadingDialog.titleLoading = title;
    return this;
  }

  @override
  void showLoadingDialog() {
    _loadingDialog = LoadingDialog(_context, _resourcesLoadingDialog);
    _loadingDialog?.show();
  }

  @override
  void dismissLoading() {
    _loadingDialog?.dismiss();
  }
}
