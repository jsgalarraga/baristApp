import 'package:coffee_app/coffee/coffee.dart';
import 'package:coffee_repository/coffee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeePage extends StatelessWidget {
  const CoffeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoffeeCubit(context.read<CoffeeRepository>()),
      child: const CoffeeView(),
    );
  }
}

class CoffeeView extends StatefulWidget {
  const CoffeeView({super.key});

  @override
  State<CoffeeView> createState() => _CoffeeViewState();
}

class _CoffeeViewState extends State<CoffeeView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: BlocBuilder<CoffeeCubit, CoffeeState>(
          builder: (context, state) {
            switch (state.status) {
              case CoffeeStatus.initial:
                return const SizedBox();
              case CoffeeStatus.loading:
              case CoffeeStatus.failure:
              case CoffeeStatus.success:
                return const _BackButton();
            }
          },
        ),
      ),
      backgroundColor: theme.backgroundColor,
      body: Center(
        child: BlocBuilder<CoffeeCubit, CoffeeState>(
          builder: (context, state) {
            switch (state.status) {
              case CoffeeStatus.initial:
                return CoffeeEmpty(
                  onRefresh: () {
                    return context.read<CoffeeCubit>().fetchCoffee();
                  },
                );
              case CoffeeStatus.loading:
                return const CoffeeLoading();
              case CoffeeStatus.success:
                return CoffeePopulated(
                  coffee: state.coffee,
                  onRefresh: () {
                    return context.read<CoffeeCubit>().fetchCoffee();
                  },
                );
              case CoffeeStatus.failure:
                return CoffeeError(
                  onRefresh: () {
                    return context.read<CoffeeCubit>().fetchCoffee();
                  },
                );
            }
          },
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return BackButton(
      color: Colors.black,
      onPressed: () {
        return context.read<CoffeeCubit>().reset();
      },
    );
  }
}
