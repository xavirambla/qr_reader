// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import '../configuration.dart';

void main() {


setUp(() async{
  confSetup();
  
});  


  group ("Help Screen" , () {
  
    // Nos facilita el widget a testear
    Widget getWidget(){
        return const  HelpScreen();
    }

/* -----------------------------------------------------------------------------------------------
   ------------------------------- Basic Test ----------------------------------------------------
   ----------------------------------------------------------------------------------------------- */

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
    expect(  find.byType( SingleChildScrollView ) , findsOneWidget);
    expect(  find.byType( RichText ) , findsWidgets);
   } );




/* -----------------------------------------------------------------------------------------------
   ------------------------------- Translation Test ----------------------------------------------
   ----------------------------------------------------------------------------------------------- */
/*

Método para probar todos los textos del widget en el idioma seleccionado.
*/ 
  languageTest (){
        var  t = getAppLocalizations(Preferences.language);   

    expect(find.text(t.helpTitle), findsOneWidget);  
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


   } );

}

