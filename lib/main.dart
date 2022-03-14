
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'share_preferences/preferences.dart';

import 'providers/providers.dart';

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
        title: 'Qr Reader',
        initialRoute:     AppRoutes.initialRoute ,
        routes:           AppRoutes.getAppRoutes(),

        theme: Provider.of<ThemeProvider>(context).currentTheme,

    );
  }
}





