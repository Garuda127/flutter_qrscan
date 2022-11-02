import 'package:flutter/material.dart';
import 'package:flutter_qrscan/models/scan_model.dart';
import 'package:flutter_qrscan/providers/scan_list_provider.dart';
import 'package:flutter_qrscan/utils/utils.dart';
import 'package:provider/provider.dart';

class SwiperBorrar extends StatelessWidget {
  final int index;
  final IconData icon;

  const SwiperBorrar({
    Key? key,
    required this.scans,
    required this.index,
    required this.icon,
  }) : super(key: key);

  final List<ScanModel> scans;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      key: UniqueKey(),
      background: Container(
        alignment: Alignment.centerLeft,
        color: Colors.red,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Borrar',
            style: TextStyle(color: Colors.white, fontSize: 38),
          ),
        ),
      ),
      onDismissed: (DismissDirection direction) {
        Provider.of<ScanListProvider>(context, listen: false)
            .borrarScanById(scans[index].id!.toInt());
      },
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(scans[index].valor),
        subtitle: Text('ID: ${scans[index].id}'),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () => launchUrl(context, scans[index]),
      ),
    );
  }
}
