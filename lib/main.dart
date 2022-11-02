import 'package:flutter/material.dart';
import 'package:flutter_qrscan/providers/scan_list_provider.dart';
import 'package:flutter_qrscan/providers/ui_provider.dart';
import 'package:flutter_qrscan/screens/home_screen.dart';
import 'package:flutter_qrscan/screens/mapa_screen.dart';

import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UiProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScanListProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomeScreen(),
          '/mapa': (context) => const MapaScreen(),
        },
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.deepPurple,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple,
          ),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.white),
              actionsIconTheme: IconThemeData(color: Colors.white),
              surfaceTintColor: Colors.white),
          primaryIconTheme: const IconThemeData(color: Colors.white),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
      ),
    );
  }
}
