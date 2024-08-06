import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuitAlertDialog extends StatelessWidget {
  const QuitAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Do you want to exit this page?'),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Go Back'),
          onPressed: () {
            GoRouter.of(context).pop(false);
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Confirm'),
          onPressed: () {
            GoRouter.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
