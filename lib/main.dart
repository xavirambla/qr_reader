
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'share_preferences/preferences.dart';

import 'providers/providers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/gen/app_localizations.dart';

import 'package:qr_reader/router/app_routes.dart';
import 'package:qr_reader/providers/providers.dart';


void main() async { 
//  await Preferences.init(); // esto fallará 
// PAra arreglarlo lanzamos este wiget y ahora funcionará
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init(); // esto fallará 
  //runApp(MyApp());
    runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider( create: ( _ ) => UiProvider()),
            ChangeNotifierProvider( create: ( _ ) => ScanListProvider()),
            ChangeNotifierProvider( create: ( _ ) => ThemeProvider(isDarkmode: Preferences.isDarkmode)),
            ChangeNotifierProvider( create: ( _ ) => LanguageProvider( language: Preferences.language )),





          ],
          child: const MyApp(),

        )

    );
}




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    
  
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        
        title:  "QR Reader" ,

//multiidioma        
        localizationsDelegates: const [                    
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale:  Provider.of<LanguageProvider>(context ).locale,

        supportedLocales:   AppLocalizations.supportedLocales ,
        initialRoute:     AppRoutes.initialRoute ,
        routes:           AppRoutes.getAppRoutes(),

        theme: Provider.of<ThemeProvider>(context).currentTheme,

    );
  }
}





