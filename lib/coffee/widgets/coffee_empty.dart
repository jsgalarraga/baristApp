import 'package:coffee_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoffeeEmpty extends StatelessWidget {
  const CoffeeEmpty({
    super.key,
    required this.onRefresh,
  });

  final ValueGetter<Future<void>> onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RichText(
            text: TextSpan(
              style: theme.textTheme.bodyMedium,
              children: [
                TextSpan(text: '${l10n.emptyCoffeeHeader}\n'),
                TextSpan(
                  text: l10n.appTitle,
                  style: theme.textTheme.headlineLarge,
                ),
              ],
            ),
          ),
          Expanded(child: SvgPicture.asset('assets/barista.svg')),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: ElevatedButton(
              onPressed: onRefresh,
              child: Text(
                l10n.getCoffeeButton,
                style: theme.textTheme.headline5?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
