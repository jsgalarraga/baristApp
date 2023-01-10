import 'package:coffee_app/l10n/l10n.dart';
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
    final l10n = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('😅', style: TextStyle(fontSize: 64)),
        Text(
          l10n.errorCoffeeTitle,
          style: theme.textTheme.headline5,
        ),
        const Gap(64),
        ElevatedButton(
          onPressed: onRefresh,
          child: Text(
            l10n.tryAgain,
            style: theme.textTheme.headline5?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
