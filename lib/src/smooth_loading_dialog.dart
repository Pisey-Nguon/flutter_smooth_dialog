import 'package:flutter/material.dart';
import 'package:smooth_dialog/src/config/dialog_config.dart';

/// A smooth loading dialog with customizable indicator
class SmoothLoadingDialog {
  SmoothLoadingDialog._();

  static OverlayEntry? _overlayEntry;
  static bool _isShowing = false;

  /// Shows a loading dialog with an optional message
  ///
  /// Example:
  /// ```dart
  /// SmoothLoadingDialog.show(
  ///   context: context,
  ///   message: 'Loading...',
  /// );
  ///
  /// // Dismiss after task completes
  /// await someAsyncTask();
  /// SmoothLoadingDialog.dismiss();
  /// ```
  static void show({
    required BuildContext context,
    String? message,
    SmoothLoadingConfig? config,
  }) {
    if (_isShowing) {
      return;
    }

    final effectiveConfig = config ?? const SmoothLoadingConfig();
    _isShowing = true;

    _overlayEntry = OverlayEntry(
      builder: (context) =>
          _LoadingDialogWidget(message: message, config: effectiveConfig),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  /// Dismisses the loading dialog
  static void dismiss() {
    if (!_isShowing || _overlayEntry == null) {
      return;
    }

    _overlayEntry?.remove();
    _overlayEntry = null;
    _isShowing = false;
  }

  /// Returns whether a loading dialog is currently showing
  static bool get isShowing => _isShowing;
}

class _LoadingDialogWidget extends StatefulWidget {
  const _LoadingDialogWidget({required this.message, required this.config});

  final String? message;
  final SmoothLoadingConfig config;

  @override
  State<_LoadingDialogWidget> createState() => _LoadingDialogWidgetState();
}

class _LoadingDialogWidgetState extends State<_LoadingDialogWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.config.animationDuration,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: GestureDetector(
        onTap: widget.config.barrierDismissible
            ? () => SmoothLoadingDialog.dismiss()
            : null,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: _buildLoadingContent(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingContent() {
    final hasMessage = widget.message != null && widget.message!.isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(20),
      constraints: BoxConstraints(
        minWidth: widget.config.size,
        minHeight: widget.config.size,
        maxWidth: 300,
      ),
      decoration: BoxDecoration(
        color: widget.config.backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: widget.config.indicatorSize,
            height: widget.config.indicatorSize,
            child:
                widget.config.customIndicator ??
                CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    widget.config.indicatorColor ??
                        Theme.of(context).primaryColor,
                  ),
                ),
          ),
          if (hasMessage) ...[
            const SizedBox(height: 16),
            Text(
              widget.message!,
              style:
                  widget.config.textStyle ??
                  const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
