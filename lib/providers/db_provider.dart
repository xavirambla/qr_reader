import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// lo importo y luego lo exporto para que cuando la importemos se añada
import 'package:qr_reader/models/scan_model.dart';
export 'package:qr_reader/models/scan_model.dart';

class DBProvider{

  static Database ?_database;  // mantiene la instancia de nuestra base de datos

  static final DBProvider db = DBProvider._(); // va a ser una instancia
                  // llamamos a un constructor privado

// constructor privado
  DBProvider._();     

  Future<Database> get database async {
    if (_database != null ) return _database!;

    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async{
      // PAth de donde almacenamos la base de datos
      Directory documentsDirectory = await getApplicationDocumentsDirectory();

      final path = join( documentsDirectory.path, 'ScansDB.db' );
 //     print ( path );

      //crear base de datos
    return await openDatabase (
      path,
      version: 1,  // ssi subimos de version , se creará de nuevo la base de datos
      onOpen: (db){}, // al abrirla , se ejecuta  
      onCreate: (Database db, int version) async{
        // las 3 comillas son  para hacer un string multilinea
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''');
//        print(' Scans created!');
/*
  await db.rawInsert('''
      INSERT INTO Scans (id, tipo, valor)
        VALUES ( 1, 'http', 'http://www.xavirambla.net'  );
      ''');

 await db.rawInsert('''
      INSERT INTO Scans (id, tipo, valor)
        VALUES ( 2, 'http', 'http://www.google.com'  );
      ''');

  await db.rawInsert('''
      INSERT INTO Scans (id, tipo, valor)
        VALUES ( 3, 'http', 'http://www.barnesandnoble.com'  );
      ''');


await db.rawInsert('''
      INSERT INTO Scans (id, tipo, valor)
        VALUES ( 10, 'geo', 'geo: 42.398037,-71.114798'  );
      ''');

await db.rawInsert('''
      INSERT INTO Scans (id, tipo, valor)
        VALUES ( 11, 'geo', 'geo: 34.026345,-118.320004'  );
      ''');

await db.rawInsert('''
      INSERT INTO Scans (id, tipo, valor)
        VALUES ( 12, 'geo', 'geo: 40.699765,-74.052686'  );
      ''');
*/

      }

    );
  }


//interacción con base de datos
  Future<int> nuevoScanRaw( ScanModel nuevoScan) async {
      final id =nuevoScan.id;
      final tipo =nuevoScan.tipo;
      final valor =nuevoScan.valor;

      final db = await database; // verificamos la base de datos

      final res = await db.rawInsert('''
      INSERT INTO Scans (id, tipo, valor)
        VALUES ( $id, '$tipo', '$valor'  );
      ''');
  //  print( res);

      return res;
  }

  //lo hacemos más facil
  Future<int> nuevoScan( ScanModel nuevoScan) async {
    final db= await database;         
    final res = await db.insert('Scans', nuevoScan.toJson() );
    return res;  // devuelve el id del último elemento insertado
  }

  Future<ScanModel> getScanById(int id) async{
    final db= await database;   
    final res = await db.query('Scans' , where: 'id = ? ',whereArgs: [ id ]  );
        return ScanModel.fromJson( res.first ) ;  // en caso de no encontrar ninguno saltará una excepción
    /*
    return res.isNotEmpty
      ? ScanModel.fromJson( res.first )
      : null;
*/
  }






  Future<List<ScanModel>> getTodosLosScans() async{
    final db= await database;   
    final res = await db.query('Scans' );
//    return res.map( (s)=> ScanModel.fromJson(s)).toList() ;

    return res.isNotEmpty
      ? res.map( (s)=> ScanModel.fromJson(s)).toList() 
      : [];



  }

  Future<List<ScanModel>> getScansPorTipo( String tipo) async{
    final db= await database;   
    final res = await db.rawQuery('''
      SELECT* FROM Scans WHERE tipo='$tipo'
    ''' );

    return res.isNotEmpty
      ? res.map( (s)=> ScanModel.fromJson(s)).toList() 
      : [];
 
  }  

  Future<int> updateScan( ScanModel nuevoScan) async {
    final db= await database;
    // sin el where hará todos los registros
    final res = await db.update('Scans', nuevoScan.toJson(), where: 'id = ?', whereArgs:[ nuevoScan.id] );    
    return res;  // devuelve el número de registros modificados

  }


Future<int> deleteScan(  int id ) async {
    final db= await database;
    // sin el where hará todos los registros
    final res = await db.delete('Scans',  where: 'id = ?', whereArgs:[ id] );    
    return res;  // devuelve el número de registros modificados

  }


Future<int> deleteAllScans(  ) async {
    final db= await database;
    // sin el where hará todos los registros
//    final res = await db.delete('Scans' );    
    final res = await db.rawDelete('DELETE FROM Scans' );    
    return res;  // devuelve el número de registros eliminados

  }
  



}