
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_reader/providers/db_provider.dart';




class MapaScreen extends StatefulWidget {
  const MapaScreen({Key? key}) : super(key: key);

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  Completer<GoogleMapController> controllerCompleter = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    // leemos los argumentos cuando nos visitan
    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;
    
    final CameraPosition  puntoInicial = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17,
      tilt:50
      );
    
// marcadores
  Set<Marker> markers=  Set<Marker>();
    markers.add(  Marker ( 
      markerId: const MarkerId('geo-location'),  // ponemos un id único
      position: scan.getLatLng()
    )  );

    return Scaffold(
      appBar:AppBar( 
        title: const Text('Mapa'),
        actions:[
          IconButton(
            onPressed: () async {
              // nos movemos al marcador
              final GoogleMapController controller = await controllerCompleter.future;
              controller.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: scan.getLatLng() ,
                  // pierdo cosas y hay que reocnfigurar de nuevo
                  zoom:17,
                  tilt: 50
                  )
                )
              );
            },
            icon: const Icon ( Icons.location_disabled )
            )

        ]

      ),
      body: GoogleMap(
        myLocationButtonEnabled: false, // quitamos el botón de colocación
//        mapType: MapType.hybrid,
        mapType: mapType ,        
        initialCameraPosition: puntoInicial,
        /*
        onMapCreated( GoogleMapController controller){
          _controller.complete(controller);
        }*/

        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if (mapType== MapType.normal) {
              mapType=MapType.satellite;
              }
          else {
            mapType= MapType.normal;
          }
         setState(() {      });       //redibujamos el widget
        },
        child: const  Icon( Icons.layers),
        ),
    );
  }
}

