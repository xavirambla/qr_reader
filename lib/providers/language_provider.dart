
import 'package:flutter/material.dart';
import 'package:qr_reader/l10n/gen/app_localizations.dart';


class LanguageProvider extends ChangeNotifier{
   late Locale locale;
    static Map<String, String> languagemap = {'Español':'es','English':'en', 'Français':'fr', 'Català':'ca'};

  LanguageProvider ({required String language}){
    // 20220406 Xavi. Falla cuando llega vacío, ponemos un valor por defecto.
    if (language=="")      language="en";

    locale = Locale.fromSubtags(languageCode: language);
  }

  static Map<String, String>  getLanguages( String selectedLanguage){
    //return languagemap;
    if (selectedLanguage==""){
       languagemap['Seleccione un idioma']=  '';
      }
    else{
      languagemap.keys
        .where((k) => languagemap[k]=='' ) // filter keys
        .toList() // create a copy to avoid concurrent modifications
        .forEach( languagemap.remove); // remove selected keys  
    }
    return languagemap;
  }

  Locale get selectedLocale{
    return locale;
  }

  set selectedLocale (Locale locale ){
    this.locale = locale;      
    notifyListeners() ;  // avisa a todos los widgets que están escuchando
  }

  
 
  Locale getLocale(String language){
    for ( Locale elem in AppLocalizations.supportedLocales ){
        if (elem.languageCode==language){
          return elem;
        }

    }
    throw Exception("No existe el idioma");

  }

  
}