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
import 'package:qr_reader/l10n/gen/app_localizations.dart';

import 'package:qr_reader/models/models.dart';
import 'package:qr_reader/screens/screens.dart';


class AppRoutes {

  static const initialRoute='home';

// almacena todas las opciones y las pantallas donde apuntan
  static final menuOptions = <MenuOption>[

       MenuOption(route: 'mapas',      name:'Mapas Screen',       title:'Mapas',        screen: const MapasScreen() ,            icon: Icons.list_alt_rounded ),
       MenuOption(route: 'mapa',      name:'Mapa Screen',         title:'Mapa',         screen: const MapaScreen() ,              icon: Icons.map ),
       MenuOption(route: 'direccion', name:'Dirección Screen',    title:'Dirección',    screen: const DireccionesScreen() ,        icon: Icons.compass_calibration ),       


       MenuOption(route: 'settings',  name:'Settings Screen',     title: 'Settings',    screen: const SettingsScreen() ,          icon: Icons.settings  ,           ),       
       MenuOption(route: 'help',      name:'Ayuda',               title: 'Help',    screen: const HelpScreen() ,                icon: Icons.help ,    ),
       MenuOption(route: 'about',     name:'Acerca de',           title: 'About',    screen: const AboutScreen() ,                icon: Icons.read_more ,  ),
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

 /*
  * Devuelve la lista de opciones que se mostraràn cuando pulse el botón Settings
  * 
  */
  static  List<MenuOption> getMenuSettings( context ){
    final filtro =  ['settings','help', 'about'];

    final settingsOptions = menuOptions.where((element) => filtro.contains(element.route)  ).toList();

    var   t = AppLocalizations.of(context);
    // las traducciones no pueden hacerse en static pq necesitamos el context, así que las hacemos un replace con el texto traducido
    settingsOptions.where((element) => element.route =="settings").first.title = t!.settingsTitle;
    settingsOptions.where((element) => element.route =="help").first.title = t.helpTitle;
    settingsOptions.where((element) => element.route =="about").first.title = t.aboutTitle;

      
    return settingsOptions;
  }

/*
 * Devuelve la pantalla de la opción en base al nombre de la pantalla
 */
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
