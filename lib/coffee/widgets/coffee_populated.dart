import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_app/coffee/coffee.dart';
import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Center(
              child: CachedNetworkImage(imageUrl: coffee.imageUrl),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: onRefresh,
                  child: const Icon(Icons.refresh),
                ),
                const Gap(32),
                ElevatedButton(
                  onPressed: onRefresh,
                  child: const Icon(Icons.download),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
