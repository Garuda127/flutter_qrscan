import 'package:flutter/material.dart';

import 'package:flutter_qrscan/providers/ui_provider.dart';
import 'package:provider/provider.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: (int value) => uiProvider.selectedMenuOpt = value,
      currentIndex: currentIndex,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration), label: 'Direcciones'),
      ],
    );
  }
}
