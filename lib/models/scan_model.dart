
import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));
String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
    ScanModel({
        this.id ,
        this.tipo,
        required this.valor,
    }){
      if( valor.contains('http')){
         tipo = 'http';
      }else{
           tipo ='geo';
      }        
    }

    int ?id;
    String ?tipo;
    String valor;

    LatLng getLatLng () {
        if (tipo != 'geo'){
          throw Exception( 'El tipo de este objeto no es una geoposición' )  ;
          }

        final latLng =  valor.substring(4).split(',');  // crea un array con la latitud  y longit
        final lat = double.parse( latLng[0]  );
        final lng = double.parse( latLng[1]  );
        return LatLng ( lat, lng );        
    }

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };

//los datos que se imprimiran
    @override
  String toString() {
    
    return '$id Tipo: $tipo  = $valor';
  }
}
