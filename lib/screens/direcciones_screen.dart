import 'package:flutter/material.dart';
import 'package:flutter_qrscan/providers/scan_list_provider.dart';
import 'package:flutter_qrscan/widgets/swiper_borrar.dart';
import 'package:provider/provider.dart';

class DireccionesScreen extends StatelessWidget {
  const DireccionesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) {
        return SwiperBorrar(scans: scans, index: index, icon: Icons.route);
      },
    );
  }
}
