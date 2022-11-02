import 'package:flutter/material.dart';
import 'package:flutter_qrscan/models/scan_model.dart';
import 'package:flutter_qrscan/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];

  String tipoSeleccionado = 'http';

  nuevoScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DbProvider.db.nuevoScan(nuevoScan);

    nuevoScan.id = id;
    if (tipoSeleccionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }
  }

  cargarScans() async {
    final scans = await DbProvider.db.getScan();
    this.scans = [...scans!];
    notifyListeners();
  }

  cargarScansTipo(String tipo) async {
    final scans = await DbProvider.db.getScanByTipo(tipo);
    this.scans = [...scans!];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DbProvider.db.deletAllScan();
    scans = [];
    notifyListeners();
  }

  borrarScanById(int id) async {
    await DbProvider.db.deleteScan(id);
  }
}
