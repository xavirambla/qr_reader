import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    final scanListProvider = Provider.of<ScanListProvider>(context); //esto se debe ejecutar cuando se reciba cambios


    return FloatingActionButton(
      elevation: 0,
      child: const Icon (Icons.filter_center_focus ),
      onPressed: () async {
//          String barcodesScanRes = await FlutterBarcodeScanner.scanBarcode( '#3D8BEF', 'Cancelar', false, ScanMode.QR );
          String barcodesScanRes = await FlutterBarcodeScanner.scanBarcode( '#080800', 'Cancelar', false, ScanMode.QR );
/*
  static const String primaryLightString = 'FFA500';
  static const String primaryDarkString = '0080800';
   */

      //   barcodesScanRes ='http://www.xavirambla.net';
//         final barcodesScanRes = 'geo: 45.287135,-75920226';
         if (barcodesScanRes =='-1') return;  // usuario ha pulsado cancelar

         final scanListProvider = Provider.of<ScanListProvider>(context,listen: false);
         final nuevoScan = await scanListProvider.nuevoScan(barcodesScanRes);
         launchURL(context, nuevoScan );



         // print ( barcodesScanRes );

      },
      );
  }
}