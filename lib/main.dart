
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/pages.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

import 'providers/providers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => new UiProvider()),
        ChangeNotifierProvider(create: ( _ ) => new ScanListProvider()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qr Reader',
        initialRoute: 'home', // solo tendremos una pantalla
        routes:{
          'home': ( _ ) => HomePage(),
          'mapa': ( _ ) => MapaPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple,
            ),
        ),
      ),
    );
  }
}