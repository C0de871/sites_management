import 'package:flutter/material.dart';

class ConfirmExportButton extends StatelessWidget {
  final VoidCallback onExport;

  const ConfirmExportButton({super.key, required this.onExport});

  void _handleExport(BuildContext context) {
    onExport();
    Navigator.pop(context);
    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Dialog(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Generating Excel file...'),
            ],
          ),
        ),
      ),
    );

    // // Simulate export completion

    // Navigator.pop(context); // Close loading dialog
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Row(
    //       children: [
    //         Icon(Icons.check_circle,
    //             color: Theme.of(context).colorScheme.surfaceContainerLowest),
    //         const SizedBox(width: 8),
    //         const Text('Sites exported successfully'),
    //       ],
    //     ),
    //     backgroundColor: Colors.green,
    //     duration: const Duration(seconds: 3),
    //     behavior: SnackBarBehavior.floating,
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _handleExport(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: const Text('Export'),
    );
  }
}
