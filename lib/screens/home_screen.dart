import 'package:flutter/material.dart';
import 'package:flutter_qrscan/providers/db_provider.dart';
import 'package:flutter_qrscan/providers/scan_list_provider.dart';
import 'package:flutter_qrscan/providers/ui_provider.dart';
import 'package:flutter_qrscan/screens/direcciones_screen.dart';
import 'package:flutter_qrscan/screens/mapas_history.dart';
import 'package:flutter_qrscan/widgets/custom_navbar.dart';
import 'package:flutter_qrscan/widgets/scan_button.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Historial',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .borrarTodos();
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.white,
              ))
        ],
      ),
      body: const _HomeScreenBody(),
      bottomNavigationBar: const CustomNavBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody();

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    DbProvider.db.database;

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansTipo('geo');
        return const MapasHistoryScreen();
      case 1:
        scanListProvider.cargarScansTipo('http');
        return const DireccionesScreen();
      default:
        return const MapasHistoryScreen();
    }
  }
}
