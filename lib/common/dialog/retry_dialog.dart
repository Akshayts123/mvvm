import 'package:flutter/material.dart';
import 'package:lilac_mvvm_user/core/app_dimensions.dart';

class RetryDialog extends StatelessWidget {
  const RetryDialog({
    super.key,
    required this.title,
    required this.onRetryPressed,
  });

  final String title;
  final VoidCallback onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape:  RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).indicatorColor, width: 1.0),
        borderRadius: BorderRadius.all(
          Radius.circular(Dimensions.RADIUS_DEFAULT),
        ),
      ),
      title:  Row(
        children: [
          Icon(Icons.warning, color: Theme.of(context).indicatorColor),
          SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
          Text("Error")
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              const SizedBox(width: 15),
              ElevatedButton(
                onPressed: onRetryPressed,
                child: const Text("Retry"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
