library easy_dialog;

import 'package:flutter/material.dart';

import 'anim_dialog.dart';
import 'material_dialog_builder_base.dart';


class EasyDialog extends MaterialDialogBuilderBase {
  final BuildContext context;

  EasyDialog(this.context);
  AnimDialog? _animDialog;

  @override
  void showDialog(){
    _animDialog = AnimDialog(context, resourcesDialog);
    _animDialog?.show();
  }

  @override
  void dismissDialog() {
    _animDialog?.dismiss();
  }

  @override
  void setDescription(String description) {
    resourcesDialog.description = description;
  }

  @override
  void setTitleHeader(String titleHeader) {
    resourcesDialog.titleHeader = titleHeader;
  }

  @override
  void setTitleNegative(String titleNegative) {
    resourcesDialog.titleNegative = titleNegative;
  }

  @override
  void setTitlePositive(String titlePositive) {
    resourcesDialog.titlePositive = titlePositive;
  }

  @override
  void addButtonNegativeListener(Function onNegativeListener) {
    resourcesDialog.onNegativeListener = onNegativeListener;
  }

  @override
  void addButtonPositiveListener(Function onPositiveListener) {
    resourcesDialog.onPositiveListener = onPositiveListener;
  }

  @override
  void setBarrierDismissible(bool barrierDismissible) {
    resourcesDialog.barrierDismissible = barrierDismissible;
  }

  @override
  void addDismissListener(Function onDismissListener) {
    resourcesDialog.onDismissListener = onDismissListener;
  }

  
}
