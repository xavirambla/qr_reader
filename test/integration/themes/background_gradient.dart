// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import '../configuration.dart';

void main() {


setUp(() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  
});  

  group ("Background gradient" , () {

    // Nos facilita el widget a testear
    Widget getWidget(){
        return   const BackgroundGradient( body: Text("Test"),  );
    }
      

//-----------------------------------------------
    testWidgets ('Basic' , 
    (WidgetTester tester) async {
      await tester.pumpWidget(    
             makeTesteableWidget( child:   getWidget()  )         
          ) ;

    expect(  find.byType( SizedBox ) ,    findsOneWidget );
    expect(  find.byType( Container ) ,   findsOneWidget );
    expect(  find.byType( Text ) ,        findsOneWidget );
    expect(  find.text( "Test" ) ,        findsOneWidget );
   
   } );



//-----------------------------------------------
    testWidgets ('Functionality - DarkMode' , 
    (WidgetTester tester) async {
      Preferences.isDarkmode = true;
      

      await tester.pumpWidget(    
             makeTesteableWidget( child: getWidget() )         
          ) ;


      BoxDecoration boxDecorationLight = BoxDecoration(
        gradient: LinearGradient(colors: [
          AppTheme.darkTheme.primaryColorLight,
          AppTheme.darkTheme.primaryColorDark,
         ],
         begin: Alignment.bottomCenter,
         end: Alignment.topCenter,
         )
        );


     Container container = tester.firstWidget(  find.byType( Container )  ) ;
     Decoration boxDecoration = container.decoration!;
     expect(boxDecoration,boxDecorationLight);
     

    
   } );

//-----------------------------------------------
    testWidgets ('Functionality - LightMode' , 
    (WidgetTester tester) async {
      Preferences.isDarkmode = false;

      await tester.pumpWidget(    
             makeTesteableWidget( child: getWidget()  )         
          ) ;


      BoxDecoration boxDecorationLight = BoxDecoration(
        gradient: LinearGradient(colors: [
          AppTheme.lightTheme.primaryColorLight,
          AppTheme.lightTheme.primaryColorDark,
         ],
         begin: Alignment.bottomCenter,
         end: Alignment.topCenter,
         )
        );


     Container container = tester.firstWidget(  find.byType( Container )  ) ;
     Decoration boxDecoration = container.decoration!;
     expect(boxDecoration,boxDecorationLight);
   } );





   } );

}

