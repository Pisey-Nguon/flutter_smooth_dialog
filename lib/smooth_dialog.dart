library easy_dialog;

import 'package:flutter/material.dart';
import 'package:smooth_dialog/resources_dialog.dart';

import 'anim_dialog.dart';
import 'material_dialog_builder_base.dart';

class SmoothDialog extends MaterialDialogBuilderBase {
  @protected
  final BuildContext _context;

  SmoothDialog(this._context);
  AnimDialog? _animDialog;
  final ResourcesDialog _resourcesDialog = ResourcesDialog();

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
  SmoothDialog setDescription(String description) {
    _resourcesDialog.description = description;
    return this;
  }

  @override
  SmoothDialog setTitleHeader(String titleHeader) {
    _resourcesDialog.titleHeader = titleHeader;
    return this;
  }

  @override
  SmoothDialog setTitleNegative(String titleNegative) {
    _resourcesDialog.titleNegative = titleNegative;
    return this;
  }

  @override
  SmoothDialog setTitlePositive(String titlePositive) {
    _resourcesDialog.titlePositive = titlePositive;
    return this;
  }

  @override
  SmoothDialog addButtonNegativeListener(Function onNegativeListener) {
    _resourcesDialog.onNegativeListener = onNegativeListener;
    return this;
  }

  @override
  SmoothDialog addButtonPositiveListener(Function onPositiveListener) {
    _resourcesDialog.onPositiveListener = onPositiveListener;
    return this;
  }

  @override
  SmoothDialog setBarrierDismissible(bool barrierDismissible) {
    _resourcesDialog.barrierDismissible = barrierDismissible;
    return this;
  }

  @override
  SmoothDialog addDismissListener(Function onDismissListener) {
    _resourcesDialog.onDismissListener = onDismissListener;
    return this;
  }
}
