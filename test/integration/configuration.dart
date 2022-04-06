
/*
Configuración para probar los tests en Integración.
*/
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:qr_reader/l10n/gen/app_localizations.dart';
import 'package:qr_reader/l10n/gen/app_localizations_en.dart';
import 'package:qr_reader/l10n/gen/app_localizations_es.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/router/app_routes.dart';
import 'package:qr_reader/share_preferences/preferences.dart';
import 'package:qr_reader/themes/themes.dart';
import 'package:qr_reader/screens/screens.dart';
import 'package:qr_reader/widgets/widgets.dart';
import 'package:qr_reader/themes/background_gradient.dart';
import 'package:qr_reader/models/models.dart';


export 'package:flutter/material.dart';
export 'package:flutter_localizations/flutter_localizations.dart';
export 'package:provider/provider.dart';
export 'package:flutter_test/flutter_test.dart';

export 'package:qr_reader/l10n/gen/app_localizations.dart';
export 'package:qr_reader/providers/providers.dart';
export 'package:qr_reader/router/app_routes.dart';
export 'package:qr_reader/share_preferences/preferences.dart';
export 'package:qr_reader/themes/themes.dart';
export 'package:qr_reader/screens/screens.dart';
export 'package:qr_reader/widgets/widgets.dart';
export 'package:qr_reader/themes/background_gradient.dart';
export 'package:qr_reader/models/models.dart';
/*
Indica los idiomas que se van a testear en la app
 */
List<Locale> getSupportedLocales(){
      return const [
             Locale('es'),
             Locale('en'),
          ];
    }

/*
Facilita un MaterialApp para poder probar el Widget facilitado
 */
MaterialApp getMaterialApp( { required Widget child } ){

    var materialApp = MaterialApp(
          localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,

             ],
          locale:  Locale( Preferences.language ),
          supportedLocales:  getSupportedLocales(),
          routes:           AppRoutes.getAppRoutes(),
          theme: Preferences.isDarkmode ? AppTheme.darkTheme : AppTheme.lightTheme,
          home: child
         );
    return materialApp;
}

/*
Crear la Configuración y todo lo  necesario para probar el Widget con los providers activados
 */
 Widget makeTesteableWidget({required Widget child}) {
    var materialApp = getMaterialApp( child:child );

    //  Pasamos los providers sino peta por todos lados
    return MultiProvider(
          providers: [
            ChangeNotifierProvider( create: ( _ ) => UiProvider()),
            ChangeNotifierProvider( create: ( _ ) => ScanListProvider()),
            ChangeNotifierProvider( create: ( _ ) => ThemeProvider(isDarkmode: Preferences.isDarkmode)),
            ChangeNotifierProvider( create: ( _ ) => LanguageProvider( language: Preferences.language )),
          ],
          child: materialApp

        );
     }

/*
Configuración básica de SetUP para nuestros tests.
*/
confSetup() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

}



// Devuelve las Localizaciones en base al lenguaje seleccionado
AppLocalizations getAppLocalizations( String language ){

  switch (language ){
    case "en": return AppLocalizationsEn();
    case "es": return AppLocalizationsEs();
    default: return AppLocalizationsEn();
  }


    }
