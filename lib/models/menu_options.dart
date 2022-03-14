/*
 *
 * Esta clase sirve para almacenar las distintas opciones que tendrá la aplicación , su ruta , su icono ,.....
 *
 * @package XaviRambla_QRReader
 * @author  Xavi xavirambla@yahoo.es
 * @created 14/02/2022
 * @copyright Copyright (c) 2022 Xavi Rambla, https://xavirambla.net .
 */
import 'package:flutter/material.dart' show IconData, Widget;  // solo importa el IconData

class MenuOption {
  final String route;   //ruta
  final IconData icon;
  final String name;   // nombre de la ruta
  final Widget screen;// la pantalla que se va a mostrar

  MenuOption( {
    required this.route,
    required this.icon,
    required this.name,
    required this.screen
  });



}



