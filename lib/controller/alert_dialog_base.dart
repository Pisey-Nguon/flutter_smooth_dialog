abstract class AlertDialogBase {
  AlertDialogBase setTitleHeader(String titleHeader);

  AlertDialogBase setDescription(String description);

  AlertDialogBase setTitlePositive(String titlePositive);

  AlertDialogBase setTitleNegative(String titleNegative);

  AlertDialogBase setBarrierDismissible(bool barrierDismissible);

  AlertDialogBase addButtonPositiveListener(Function onPositiveListener);

  AlertDialogBase addButtonNegativeListener(Function onNegativeListener);

  AlertDialogBase addDismissListener(Function onDismissListener);

  void showDialog();

  void dismissDialog();
}
