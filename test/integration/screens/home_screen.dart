// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:qr_reader/l10n/gen/app_localizations_es.dart';

import '../configuration.dart';

void main() {


setUp(() async{
  confSetup();
   
  
  
});  

  group ("Home Screen" , () {

    // Nos facilita el widget a testear
    Widget getWidget(){
        return const  HomeScreen();
    }


//-----------------------------------------------
    testWidgets ('Basic' , 
    (WidgetTester tester) async {
      await tester.pumpWidget(    
             makeTesteableWidget( child:   getWidget()  )         
          ) ;

      
    //Basic Widgets
    expect(  find.byType( Scaffold ) , findsOneWidget);
    expect(  find.byType( AppBar ) , findsOneWidget);
    expect(  find.byType( Background ) , findsOneWidget);

    //Specific Widgets
    expect(  find.byType( CustomNavigationBar ) , findsOneWidget  );
    expect(  find.byType( ScanButton ) , findsOneWidget  );
    expect(  find.byType( Background ) , findsOneWidget  );
    expect(  find.byType( PopupMenuButton ) , findsOneWidget  );
 
   
   } );

/* -----------------------------------------------------------------------------------------------
   ------------------------------- Translation Test ----------------------------------------------
   ----------------------------------------------------------------------------------------------- */
/*

Método para probar todos los textos del widget en el idioma seleccionado.
*/ 
  languageTest (){
        var  t = getAppLocalizations(Preferences.language);   

        expect(find.text(t.homeTitle)                      , findsOneWidget);
        expect(find.text(t.mapTitle)                      , findsOneWidget);
        expect(find.text(t.addressTitle)                      , findsOneWidget);

  }
//-----------------------------------------------
    testWidgets ('English Text' , 
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(    
             makeTesteableWidget( child: getWidget()  )         
          ) ;               
        languageTest ();    

   } );

//-----------------------------------------------
    testWidgets ('Spanish Text' , 
    (WidgetTester tester) async {
      Preferences.language="es";
      await tester.pumpWidget(    
             makeTesteableWidget( child: getWidget()  )         
          ) ;
        languageTest ( );

   } );


/* -----------------------------------------------------------------------------------------------
   ------------------------------- Functionality Test ----------------------------------------------
   ----------------------------------------------------------------------------------------------- */
    testNavigation( String titleScreen1, String titleScreen2, String labelOption, WidgetTester tester ) async {

      expect(  find.byType( PopupMenuButton ) , findsOneWidget  );
      await tester.tap( find.byType( PopupMenuButton ).first  );
      await tester.pump();
      await tester.pump(const Duration(seconds: 1)); // finish the menu animation


      expect(find.text( labelOption ), findsOneWidget);
     
    await tester.tap(find.text( labelOption ).first);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 1)); // end the navigation

      expect ( find.text(  titleScreen1 ) , findsNothing);
      expect ( find.text( titleScreen2 ) ,findsOneWidget );


    }

    testWidgets ('Navigate to Settings Screen' , 
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(    
             makeTesteableWidget( child: getWidget()  )         
          ) ;
      
      var  t = getAppLocalizations(Preferences.language);  

      testNavigation( t.homeTitle, t.settingsTitle, t.settingsTitle,  tester );

   } );



    testWidgets ('Navigate to About Screen' , 
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(    
             makeTesteableWidget( child: getWidget()  )         
          ) ;
      
      var  t = getAppLocalizations(Preferences.language);  

      testNavigation( t.homeTitle, t.aboutTitle, t.aboutTitle,  tester );

   } );


    testWidgets ('Navigate to Help Screen' , 
    (WidgetTester tester) async {
      Preferences.language="en";
      await tester.pumpWidget(    
             makeTesteableWidget( child: getWidget()  )         
          ) ;
      
      var  t = getAppLocalizations(Preferences.language);  

      testNavigation( t.homeTitle, t.helpTitle, t.helpTitle,  tester );

   } );





    testWidgets ('See URLs' , 
    (WidgetTester tester) async {
      Preferences.language="en";
      UiProvider uiProvider = UiProvider();
      print( "UiProvider : ${uiProvider.selectedMenuOpt}");
      

  //  final temp = new ScanModel(id : null, valor: 'http://www.xavirambla.net');
     ScanListProvider scanListProvider = ScanListProvider();
     scanListProvider.cargarScans();
     scanListProvider.nuevoScan( 'http://www.xavirambla.net' );
     scanListProvider.nuevoScan( 'http://www.google.com' );
     scanListProvider.nuevoScan( 'geo:41.37665461851155, 2.1319648416241295' );
     scanListProvider.nuevoScan( 'geo: 34.026345,-118.320004' );
       print("Núm de registros : ${scanListProvider.scans.length}");
//     DBProvider.db.nuevoScan(temp);

      await tester.pumpWidget(    
             makeTesteableWidget( child: getWidget()  )         
          ) ;
     scanListProvider.nuevoScan( 'http://www.xavirambla.net' );
     scanListProvider.nuevoScan( 'http://www.google.com' );
     scanListProvider.nuevoScan( 'geo:41.37665461851155, 2.1319648416241295' );
     scanListProvider.nuevoScan( 'geo: 34.026345,-118.320004' );          
       await tester.pump(const  Duration( seconds: 1 ));

       print("Núm de registros : ${scanListProvider.scans.length}");
//      List<ScanModel> lista  = await DBProvider.db.getTodosLosScans();
    //  List lista  = await db.getTodosLosScans();
      print("--------------------");
  //    print(" COUNT  ${ lista.length } "  );
      /*
      lista.forEach( (element) { print(element) ;} );
    */

                    expect ( find.text( '34.026345' ) ,findsOneWidget ); 
          expect ( find.text( 'http://www.xavirambla.net' ) ,findsOneWidget );
          expect ( find.text( '2.1319648416241295' ) ,findsOneWidget );    
          expect ( find.text( 'http://www.xavirambla.net' ) ,findsOneWidget );

   } );





/*
//-----------------------------------------------
    testWidgets ('Functionality - Change Colors' , 
    (WidgetTester tester) async {
      Preferences.language="en";      
      await tester.pumpWidget(    
             makeTesteableWidget( child: getWidget()  )         
          ) ;

      // DarK Mode
      var switchListTile =  find.byType( SwitchListTile );
      expect( switchListTile, findsOneWidget );
      var oldMode = Preferences.isDarkmode;
      Text oldtext = tester.firstWidget( find.text('Dark Mode') );  
      Color oldColor = oldtext.style?.color ?? Colors.red;   // cogemos el color actual del texto 

      await tester.tap( switchListTile );   // cambiamos el modo Dark
      await tester.pump();
      expect ( Preferences.isDarkmode , !oldMode);   // Comprobamos que ya no mantenemos el mismo valor en Preferences

     
      Text text = tester.firstWidget( find.text('Dark Mode') );  
      expect( text.style!.color != oldColor , true );   // comprobamos que se ha cambiado el color del texto
       if (Preferences.isDarkmode){ 
           expect( text.style!.color  , AppTheme.darkTheme.textTheme.bodyText1!.color );  
       }
        else{
          expect( text.style!.color  ,AppTheme.lightTheme.textTheme.bodyText1!.color );
        }


    
   } );


*/
   } );

}

