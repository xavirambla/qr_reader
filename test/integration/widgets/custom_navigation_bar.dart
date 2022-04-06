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

  group ("Custom Navigation Bar" , () {

    // Nos facilita el widget a testear
    Widget getWidget(){
        return   const CustomNavigationBar(  items: 
         [  // como mínimo 2 items
        BottomNavigationBarItem(
          icon:   Icon (Icons.map ),
          label: "aaa"
           
        ),
        BottomNavigationBarItem(
          icon:  Icon (Icons.compass_calibration ),
          label: "bbb"
        ),        
        BottomNavigationBarItem(
          icon:  Icon (Icons.compass_calibration ),
          label: "ccc"
        ),                
      ]
         , );
    }
      


//-----------------------------------------------
    testWidgets ('Basic' , 
    (WidgetTester tester) async {
      await tester.pumpWidget(    
             makeTesteableWidget( child:   getWidget()  )         
          ) ;


    expect(  find.byType( BottomNavigationBar ) , findsOneWidget);
    expect(  find.text( "aaa" ) , findsOneWidget);
    expect(  find.text( "bbb" ) , findsOneWidget);
    expect(  find.text( "ccc" ) , findsOneWidget);    
 
    
   } );



//-----------------------------------------------
    testWidgets ('Functionality - Get child' , 
    (WidgetTester tester) async {
      Preferences.isDarkmode = false;

      await tester.pumpWidget(    
             makeTesteableWidget( child: getWidget()  )         
          ) ;

     BottomNavigationBar bottomNavigationBar = tester.firstWidget(  find.byType( BottomNavigationBar )  ) ;
          
     expect( bottomNavigationBar.items.length,3);
     expect( bottomNavigationBar.items.first.label , "aaa");
     expect( bottomNavigationBar.items.last.label , "ccc");

    
   } );

//-----------------------------------------------
    testWidgets ('Functionality - DarkMode' , 
    (WidgetTester tester) async {
      Preferences.isDarkmode = true;

      await tester.pumpWidget(    
             makeTesteableWidget( child: getWidget()  )         
          ) ;

     BottomNavigationBar bottomNavigationBar = tester.firstWidget(  find.byType( BottomNavigationBar )  ) ;
     expect (bottomNavigationBar.selectedItemColor, AppTheme.darkTheme.primaryColor  );

    
   } );

//-----------------------------------------------
    testWidgets ('Functionality - LightMode' , 
    (WidgetTester tester) async {
      Preferences.isDarkmode = false;

      await tester.pumpWidget(    
             makeTesteableWidget( child: getWidget()  )         
          ) ;

     BottomNavigationBar bottomNavigationBar = tester.firstWidget(  find.byType( BottomNavigationBar )  ) ;
     expect (bottomNavigationBar.selectedItemColor, AppTheme.lightTheme.primaryColor  );    
   } );


   } );

}

