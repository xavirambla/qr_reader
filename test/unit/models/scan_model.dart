// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:qr_reader/models/scan_model.dart';

void main() {

  group ("Scan_model - Basic" , () {
    test ('Crear elemento',(){
      final scanModel = ScanModel(valor: 'http://www.xavirambla.net' );
      expect(scanModel , isNotNull );
 
    });

    test ('Crear elemento Web',(){
      final scanModel = ScanModel(valor: 'http://www.xavirambla.net' );
      expect(scanModel.tipo , "http" );

    });

    test ('Crear elemento Geo',(){
      final scanModel = ScanModel(valor: 'geo: 42.398037,-71.114798' );
      expect( scanModel.tipo  , "geo" );

    });


    test ('Método getLatLng',(){
      final scanModel = ScanModel(valor: 'geo: 42.398037,-71.114798' );     

      expect(scanModel.getLatLng() , equals( const LatLng ( 42.398037, -71.114798 )));

    });    

    test ('Exception Método getLatLng',(){
      final scanModel = ScanModel(valor: 'http://www.xavirambla.net' );    

      expect(() => scanModel.getLatLng() , throwsA( isA<Exception>()));
    });    


    test ('toJSON',(){
      final scanModel = ScanModel(valor: 'http://www.xavirambla.net' );   
      final json = scanModel.toJson(); 
      expect (json ,  isNotEmpty  );          
      expect (json['valor'] , 'http://www.xavirambla.net' );

    });    

    test ('fromJSON',(){
      final scanModel = ScanModel(valor: 'http://www.xavirambla.net' );   
      final json = scanModel.toJson(); 
      final newScanModel = ScanModel.fromJson(json);

      expect ( newScanModel.valor  , scanModel.valor );          
    });    

    test ('toString',(){
      final scanModel = ScanModel(valor: 'http://www.xavirambla.net' );   
      final texto     = scanModel.toString(); 
      
      expect( texto  , isNotEmpty );
      expect( texto  , contains( 'http://www.xavirambla.net' ) );
  
    });    








  });



}


/*
void main() async {
  //
Location _locationModel;
StreamController<Location> _controller;
setUp(() {
    _controller = StreamController<Location>();
    _locationModel = Location(city: 'London');
  });
group('[Location Model]', () {
    //
test('[Model] Check individual values', () async {
      _locationModel = Location(
        city: 'London',
        countryName: 'England',
        country: 'England',
        currency: 'GBP',
        ip: '',
        inEu: true,
        languages: 'EN',
      );
// BEGIN TESTS....
      expect(_locationModel.city, 'London');
expect(_locationModel.countryName.runtimeType, equals(String));
expect(_locationModel.country, isNotNull);
expect(_locationModel.ip, isEmpty);
expect(_locationModel.inEu, isTrue);
expect(_locationModel.languages, contains('EN'));
expect(_locationModel.currency, startsWith('G'));
expect(_locationModel.country, matches('England'));
    });
}

*/
