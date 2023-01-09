import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CoffeeEmpty extends StatelessWidget {
  const CoffeeEmpty({
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
        const Text('☕️', style: TextStyle(fontSize: 80)),
        const Gap(64),
        ElevatedButton(
          onPressed: onRefresh,
          child: Text(
            'Get a coffee!',
            style: theme.textTheme.headline5?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
