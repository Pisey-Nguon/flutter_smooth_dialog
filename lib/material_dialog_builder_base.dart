import 'package:easy_dialog/resources_dialog.dart';
import 'package:flutter/cupertino.dart';

abstract class MaterialDialogBuilderBase {

  @protected
  ResourcesDialog resourcesDialog = ResourcesDialog();

  void setTitleHeader(String titleHeader);

  void setDescription(String description);

  void setTitlePositive(String titlePositive);

  void setTitleNegative(String titleNegative);

  void setBarrierDismissible(bool barrierDismissible);

  void addButtonPositiveListener(Function onPositiveListener);

  void addButtonNegativeListener(Function onNegativeListener);

  void addDismissListener(Function onDismissListener);

  void showDialog();

  void dismissDialog();
}