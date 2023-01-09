import 'package:flutter/material.dart';

class CoffeeLoading extends StatelessWidget {
  const CoffeeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
