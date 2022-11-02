import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_qrscan/providers/scan_list_provider.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 10,
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        // const barcodeScanRes = 'https://f95zone.to';

        if (barcodeScanRes == '-1') {
          return;
        }

        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        scanListProvider.nuevoScan(barcodeScanRes);

        // scanListProvider.nuevoScan('geo:20.127858,-101.207843');
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
