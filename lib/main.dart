import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'provider/country_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CountryProvider())],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'Country Explorer',

        theme: ThemeData(
          useMaterial3: true,

          primarySwatch: Colors.indigo,

          scaffoldBackgroundColor: const Color(0xFFF5F7FB),

          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF00897B),

            foregroundColor: Colors.white,

            centerTitle: true,
          ),

          cardTheme: CardThemeData(
            color: Colors.white,

            elevation: 4,

            shadowColor: Colors.black12,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),

        home: const HomeScreen(),
      ),
    );
  }
}
