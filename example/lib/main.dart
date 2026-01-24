import 'package:flutter/material.dart';
import 'package:smooth_dialog/smooth_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smooth Dialog Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showBasicDialog() {
    SmoothAlertDialog.show(
      context: context,
      title: 'Basic Alert',
      content: 'This is a simple alert dialog with default settings.',
      positiveButton: DialogButton(
        text: 'OK',
        onPressed: (dialog) => dialog.dismiss(),
      ),
    );
  }

  void _showConfirmDialog() {
    SmoothAlertDialog.show(
      context: context,
      title: 'Confirm Action',
      content: 'Are you sure you want to proceed with this action?',
      positiveButton: DialogButton(
        text: 'Confirm',
        onPressed: (dialog) {
          dialog.dismiss();
          _showSnackbar('Action confirmed!');
        },
      ),
      negativeButton: DialogButton(
        text: 'Cancel',
        onPressed: (dialog) {
          dialog.dismiss();
          _showSnackbar('Action cancelled');
        },
      ),
    );
  }

  void _showCustomStyledDialog() {
    SmoothAlertDialog.show(
      context: context,
      title: 'Custom Styled Dialog',
      content: 'This dialog has custom colors and styles applied.',
      positiveButton: DialogButton(
        text: 'Got it',
        onPressed: (dialog) => dialog.dismiss(),
      ),
      config: SmoothDialogConfig(
        backgroundColor: Colors.blue.shade50,
        titleStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        contentStyle: const TextStyle(fontSize: 16, color: Colors.black87),
        positiveButtonStyle: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
        icon: const Icon(Icons.info_outline, size: 48, color: Colors.blue),
      ),
    );
  }

  void _showSuccessDialog() {
    SmoothAlertDialog.show(
      context: context,
      title: 'Success!',
      content: 'Your operation completed successfully.',
      positiveButton: DialogButton(
        text: 'Great',
        onPressed: (dialog) => dialog.dismiss(),
      ),
      config: const SmoothDialogConfig(
        icon: Icon(Icons.check_circle_outline, size: 64, color: Colors.green),
        titleStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }

  void _showErrorDialog() {
    SmoothAlertDialog.show(
      context: context,
      title: 'Error',
      content: 'Something went wrong. Please try again.',
      positiveButton: DialogButton(
        text: 'Retry',
        onPressed: (dialog) {
          dialog.dismiss();
          _showSnackbar('Retrying...');
        },
      ),
      negativeButton: DialogButton(
        text: 'Cancel',
        onPressed: (dialog) => dialog.dismiss(),
      ),
      config: const SmoothDialogConfig(
        icon: Icon(Icons.error_outline, size: 64, color: Colors.red),
        titleStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
  }

  void _showLoadingDialog() {
    SmoothLoadingDialog.show(context: context, message: 'Loading...');

    // Simulate an async operation
    Future.delayed(const Duration(seconds: 2), () {
      SmoothLoadingDialog.dismiss();
      _showSnackbar('Loading completed!');
    });
  }

  void _showCustomLoadingDialog() {
    SmoothLoadingDialog.show(
      context: context,
      message: 'Processing your request',
      config: SmoothLoadingConfig(
        backgroundColor: Colors.purple.shade50,
        indicatorColor: Colors.purple,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.purple,
        ),
        size: 120,
        indicatorSize: 50,
      ),
    );

    // Simulate an async operation
    Future.delayed(const Duration(seconds: 3), () {
      SmoothLoadingDialog.dismiss();
      _showSnackbar('Processing completed!');
    });
  }

  void _showNonDismissibleDialog() {
    SmoothAlertDialog.show(
      context: context,
      title: 'Important Notice',
      content:
          'You must read and accept to continue. This dialog cannot be dismissed by tapping outside.',
      positiveButton: DialogButton(
        text: 'Accept',
        onPressed: (dialog) {
          dialog.dismiss();
          _showSnackbar('Accepted');
        },
      ),
      negativeButton: DialogButton(
        text: 'Decline',
        onPressed: (dialog) => dialog.dismiss(),
      ),
      config: const SmoothDialogConfig(barrierDismissible: false),
    );
  }

  void _showCustomWidgetDialog() {
    SmoothAlertDialog.show(
      context: context,
      titleWidget: const Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 32),
          SizedBox(width: 12),
          Text(
            'Custom Widget',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      contentWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('This dialog uses custom widgets for title and content.'),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'You can add any widget you want here!',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
      positiveButton: DialogButton(
        text: 'Awesome',
        onPressed: (dialog) => dialog.dismiss(),
      ),
    );
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smooth Dialog Examples'), elevation: 2),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Alert Dialogs',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildButton(
            'Basic Alert',
            'Simple dialog with OK button',
            Icons.info,
            Colors.blue,
            _showBasicDialog,
          ),
          _buildButton(
            'Confirm Dialog',
            'Dialog with positive and negative buttons',
            Icons.help_outline,
            Colors.orange,
            _showConfirmDialog,
          ),
          _buildButton(
            'Custom Styled',
            'Dialog with custom colors and styles',
            Icons.palette,
            Colors.purple,
            _showCustomStyledDialog,
          ),
          _buildButton(
            'Success Dialog',
            'Dialog with success styling',
            Icons.check_circle,
            Colors.green,
            _showSuccessDialog,
          ),
          _buildButton(
            'Error Dialog',
            'Dialog with error styling',
            Icons.error,
            Colors.red,
            _showErrorDialog,
          ),
          _buildButton(
            'Non-Dismissible',
            'Dialog that requires user action',
            Icons.lock,
            Colors.grey,
            _showNonDismissibleDialog,
          ),
          _buildButton(
            'Custom Widget',
            'Dialog with custom title and content widgets',
            Icons.widgets,
            Colors.teal,
            _showCustomWidgetDialog,
          ),
          const SizedBox(height: 24),
          const Text(
            'Loading Dialogs',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildButton(
            'Basic Loading',
            'Simple loading dialog',
            Icons.hourglass_empty,
            Colors.blue,
            _showLoadingDialog,
          ),
          _buildButton(
            'Custom Loading',
            'Loading dialog with custom styling',
            Icons.pending,
            Colors.purple,
            _showCustomLoadingDialog,
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onPressed,
      ),
    );
  }
}
