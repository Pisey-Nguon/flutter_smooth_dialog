import 'package:flutter/material.dart';

/// Dialog controller for managing dialog state
class SmoothDialogController {
  final BuildContext _context;

  /// Creates a dialog controller with the given context
  SmoothDialogController(this._context);

  /// Dismisses the dialog
  void dismiss() {
    if (_context.mounted) {
      Navigator.of(_context).pop();
    }
  }

  /// Gets the BuildContext for advanced operations
  BuildContext get context => _context;
}

/// Combines button text with its callback action
class DialogButton {
  /// The text to display on the button
  final String text;

  /// The action to perform when button is pressed
  final void Function(SmoothDialogController dialog) onPressed;

  const DialogButton({required this.text, required this.onPressed});
}
