import 'package:coffee_app/coffee/coffee.dart';
import 'package:coffee_app/l10n/l10n.dart';
import 'package:coffee_repository/coffee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required CoffeeRepository coffeeRepository,
  }) : _coffeeRepository = coffeeRepository;

  final CoffeeRepository _coffeeRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _coffeeRepository,
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const CoffeePage(),
      ),
    );
  }
}
