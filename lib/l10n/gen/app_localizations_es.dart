


import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get language => 'Español';

  @override
  String get languageTitle => 'Lenguaje';

  @override
  String get appTitle => 'QR-Reader';

  @override
  String get abrirPersonalizacion => 'Abrir Personalización';

  @override
  String get settingsTitle => 'Personalización';

  @override
  String get darkmode => 'Modo oscuro';

  @override
  String get homeTitle => 'Historial';

  @override
  String get helpTitle => 'Ayuda';

  @override
  String get aboutTitle => 'Acerca de';

  @override
  String get version => 'Versión';

  @override
  String get buildNumber => 'Número de Compilación';

  @override
  String get author => '@ 2021-2022 Xavi Rambla';

  @override
  String get copyright => 'Todos los derechos reservados';

  @override
  String get mapTitle => 'Mapa';

  @override
  String get addressTitle => 'Direcciones';

  @override
  String get deleteAll => 'Borrar todos';

  @override
  String get help_description_1 => 'Lector de QRS para obtener URLs o coordenadas de Posicionamiento.';

  @override
  String get help_description_2 => 'El menú inferior dispone del botón de scaneo y incluye dos botones para visitar el historial de mapas o direcciones.';

  @override
  String get help_description_3 => 'Todas las lecturas serán almacenadas en una base de datos interna dentro del mòvil para poder ser consultadas';

  @override
  String get help_description_4 => 'Es posible, la eliminación individual de una lectura o la eliminación de todas las lecturas mediante el click del correspondiente botón.';

  @override
  String get help_title_5 => 'No hay Compartición de datos';

  @override
  String get help_description_5 => 'Las lecturas realizadas NO se transmitirán por internet imposibilitando la usabilidad de dicha información por terceros.';
}
