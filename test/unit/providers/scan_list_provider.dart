
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:sqflite/sqflite.dart';


import '../../integration/configuration.dart';


void main() {

  /*
  NO SE PUEDE TESTEAR PQ;  According to the Sqflite plugin's readme page sqfLite this package is not supported on flutter web.
  */ 
/*
  group ("Basic" , () {
    WidgetsFlutterBinding.ensureInitialized();
     

//    ScanListProvider scanListProvider = ScanListProvider();

    test ('Initial state' , ()  {

      ScanListProvider scanListProvider = ScanListProvider();
      //when

      //then
      expect( scanListProvider.scans, isEmpty );
    });

    test ('Insert Record' , () async {
      
      ScanListProvider scanListProvider = ScanListProvider();
      var a = await scanListProvider.nuevoScan( 'http://www.xavirambla.net' );

       expect( 1, 1 );
    });


    test ('connectBD' , ()  {
      ScanListProvider scanListProvider = ScanListProvider();
      //when
      scanListProvider.cargarScans();

  
   var a = scanListProvider.nuevoScan( 'http://www.xavirambla.net' );
     print(scanListProvider.scans);
  scanListProvider.cargarScans();
  print(scanListProvider.scans);
  print(a);
      //then
      expect( scanListProvider.scans, isEmpty );
    });


//    test ('Insert Record' , ()  {
      
      ScanListProvider scanListProvider = ScanListProvider();
      
      //when
      scanListProvider.cargarScans();
      print( DBProvider.db.database );
      print( DBProvider.db.database.toString() );
      print( DBProvider.db.toString() );
      print( DBProvider.db.runtimeType );
      print( DBProvider.db.initDB() );
  
  scanListProvider.nuevoScan( 'http://www.xavirambla.net' );
  
      //then
      expect( scanListProvider.scans, isEmpty );
      
//      expect( 1, 1 );
 //   });
    





    test ('Insert Scans' , ()  async{
      WidgetsFlutterBinding.ensureInitialized();
      
      ScanListProvider scanListProvider = ScanListProvider();
      //when
      print("1");
      final ScanModel a = await scanListProvider.nuevoScan("http://www.xavirambla.net");
      print("2");
      print(a);
      print(a.valor);

      scanListProvider.nuevoScan( 'http://www.xavirambla.net' );
      scanListProvider.nuevoScan( 'http://www.google.com' );
      scanListProvider.nuevoScan( 'geo:41.37665461851155, 2.1319648416241295' );

      //then
      expect( scanListProvider.scans, isEmpty );
    });




  });

*/

    }      