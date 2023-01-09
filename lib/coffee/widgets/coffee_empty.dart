import 'package:flutter/material.dart';

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
        const Text('☕️', style: TextStyle(fontSize: 64)),
        Text(
          'Get a coffee!',
          style: theme.textTheme.headline5,
        ),
      ],
    );
  }
}
