import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton( 
      onPressed: () => Navigator.pop(context),
      child: const Text('Cancel'),
    );
  }
}
