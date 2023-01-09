import 'package:coffee_app/coffee/coffee.dart';
import 'package:flutter/material.dart';

class CoffeePopulated extends StatelessWidget {
  const CoffeePopulated({
    super.key,
    required this.coffee,
    required this.onRefresh,
  });

  final Coffee coffee;
  final ValueGetter<Future<void>> onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 48),
              Text(
                'coffee image placeholder',
                style: theme.textTheme.headline2?.copyWith(
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
