import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CoffeeError extends StatelessWidget {
  const CoffeeError({
    super.key,
    required this.onRefresh,
  });

  final ValueGetter<Future<void>> onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('😅', style: TextStyle(fontSize: 64)),
        Text(
          'Something went wrong!',
          style: theme.textTheme.headline5,
        ),
        const Gap(64),
        ElevatedButton(
          onPressed: onRefresh,
          child: Text(
            'Try again',
            style: theme.textTheme.headline5?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
