import 'package:smooth_dialog/smooth_dialog.dart';

abstract class MaterialDialogBuilderBase {
  SmoothDialog setTitleHeader(String titleHeader);

  SmoothDialog setDescription(String description);

  SmoothDialog setTitlePositive(String titlePositive);

  SmoothDialog setTitleNegative(String titleNegative);

  SmoothDialog setBarrierDismissible(bool barrierDismissible);

  SmoothDialog addButtonPositiveListener(Function onPositiveListener);

  SmoothDialog addButtonNegativeListener(Function onNegativeListener);

  SmoothDialog addDismissListener(Function onDismissListener);

  void showDialog();

  void dismissDialog();
}
