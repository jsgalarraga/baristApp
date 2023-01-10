import 'package:coffee_app/coffee/coffee.dart';
import 'package:coffee_app/l10n/l10n.dart';
import 'package:coffee_repository/coffee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
          backgroundColor: const Color(0xffffead5),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xffb58b61),
            primary: const Color(0xffb58b61),
          ),
          textTheme: GoogleFonts.poppinsTextTheme(
            const TextTheme(
              bodyMedium: TextStyle(fontSize: 16),
              headlineSmall: TextStyle(fontSize: 24),
              headlineLarge: TextStyle(
                fontSize: 40,
                height: 1.2,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const CoffeePage(),
      ),
    );
  }
}
