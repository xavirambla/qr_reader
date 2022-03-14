/*
 *
 *  Lugar donde colocamos todas las rutas de la aplicación para acceder a todas las opciones.
 *
 * @package XaviRambla_Sudoku
 * @author  Xavi xavirambla@yahoo.es
 * @created 14/02/2022
 * @copyright Copyright (c) 2022 Xavi Rambla, https://xavirambla.net .
 */


import 'package:flutter/material.dart';
import 'package:qr_reader/models/models.dart';
import 'package:qr_reader/screens/screens.dart';


class AppRoutes {

  static const initialRoute='home';

// almacena todas las opciones y las pantallas donde apuntan
  static final menuOptions = <MenuOption>[

       MenuOption(route: 'mapas',      name:'Mapas Screen',             screen: const MapasScreen() ,            icon: Icons.list_alt_rounded ),
       MenuOption(route: 'mapa',      name:'Mapa Screen',             screen: const MapaScreen() ,              icon: Icons.list_alt_rounded ),
       MenuOption(route: 'direccion', name:'Dirección Screen',        screen: const DireccionesScreen() ,        icon: Icons.list_alt_rounded ),       
       MenuOption(route: 'settings',  name:'Settings Screen',         screen: const SettingsScreen() ,          icon: Icons.list_alt_rounded ),
  ];

  static  Map<String, Widget Function(BuildContext)> getAppRoutes(){
    Map<String, Widget Function(BuildContext)> appRoutes ={   };

     // lo saco del menu per lo mantengo en la página principal
    appRoutes.addAll( { 'home' :  (BuildContext context) => const  HomeScreen() } );

    for (final option in menuOptions ) {
      appRoutes.addAll( {  option.route   : ( BuildContext context) => option.screen   } ) ;
    }

    return appRoutes;
  
  }

  static Widget getScreen( screenName ){
    for (final option in menuOptions ) {
        if (screenName == option.route){
           return option.screen;
        }

    }
    throw RouteException();
    
  }



/*
  static Route<dynamic> onGenerateRoute (RouteSettings settings){
        return MaterialPageRoute(
          builder:  (context) =>  const AlertScreen() );

  }
*/



}

class RouteException implements Exception {
  String errorMessage() {
    return ("Route not exists");
  }
}
