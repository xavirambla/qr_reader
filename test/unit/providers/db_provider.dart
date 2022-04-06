

import 'package:sqflite/sqflite.dart';

import '../../integration/configuration.dart';


void main() {

  group ("Basic" , () {
    test ('Initial state' , ()  async {

    Database database = await DBProvider.db.database;
    print("--------------------------------------");
    print(database);

    Database database1 = await DBProvider.db.database;
    
    print(database.isOpen);
    DBProvider.db.initDB();
    expect(database, database1 );

    });
/*

    test ('Initial state1' , () async {
  //    Database database = await DBProvider.db.database;
//     ScanListProvider scanListProvider = ScanListProvider();
    
  
//    final nuevoScan =  ScanModel(valor: 'http://www.xavirambla.net');
    final id = await DBProvider.db.nuevoScan( ScanModel(valor: 'http://www.xavirambla.net') );
    print(id);
    print("----------");
     expect(id, 0 );

/*
     scanListProvider.nuevoScan( 'http://www.xavirambla.net' );
     scanListProvider.nuevoScan( 'http://www.google.com' );
     scanListProvider.nuevoScan( 'geo:41.37665461851155, 2.1319648416241295' );
     scanListProvider.nuevoScan( 'geo: 34.026345,-118.320004' );      
     */

    });
*/



  });

    }      