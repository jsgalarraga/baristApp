import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_app/coffee/coffee.dart';
import 'package:coffee_app/image_saver/cubit/image_saver_cubit.dart';
import 'package:coffee_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
    final l10n = context.l10n;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              l10n.populatedCoffeeTitle,
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: CachedNetworkImage(imageUrl: coffee.imageUrl),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await context
                        .read<ImageSaverCubit>()
                        .saveImageFromUrl(coffee.imageUrl);
                  },
                  child: const Icon(Icons.download),
                ),
                const Gap(32),
                ElevatedButton(
                  onPressed: onRefresh,
                  child: const Icon(Icons.autorenew),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
