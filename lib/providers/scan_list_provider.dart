

import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];

  String tipoSeleccionado="http";

  Future<ScanModel> nuevoScan ( String valor) async{
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    // asignar el id de la base de datos al modelo
    nuevoScan.id=id;
    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.scans.add(nuevoScan);    //solo lo insertamos en caso de estar viendo lo mismo
      notifyListeners();
      }
  return nuevoScan;
  }

  cargarScans() async{ 
      final scans = await DBProvider.db.getTodosLosScans();
      this.scans = [...scans]; // creo un nuevo array y lo pongo en el atributo
      notifyListeners();
  }
  cargarScansPorTipo(String tipo) async {
      final scans = await DBProvider.db.getScansPorTipo(tipo);
      this.scans = [...scans]; // creo un nuevo array y lo pongo en el atributo
      this.tipoSeleccionado= tipo;
      notifyListeners();    
  }
  borrarTodos() async {
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }
  borrarScanPorId (int id) async {
    await DBProvider.db.deleteScan(id);
    cargarScansPorTipo( this.tipoSeleccionado ); // aquí ya hay el notifyListeners    
  }




}