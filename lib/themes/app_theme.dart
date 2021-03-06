/*
 *
 * Esta clase sirve para configurar los light y dark temas de la aplicación.
 *
 * @package XaviRambla_Curriculum
 * @author  Xavi xavirambla@yahoo.es
 * @created 14/02/2022
 * @copyright Copyright (c) 2022 Xavi Rambla, https://xavirambla.net .
 */
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryLight =  Colors.orange;  
  static const Color primaryDark  =  Colors.teal;  
  static const Color primary      =  Colors.orange;  


  static Color backgroundColorLight =  Colors.orange[50]!   ;    
  static Color backgroundColorLight1 =  Colors.orange[100]!   ;   
/*
  static Color backgroundColorLight =  Colors.orange   ;    
  static Color backgroundColorLight1 =  Colors.orange   ;   
*/
  static Color backgroundColorDark =  Colors.blueGrey[700]!   ;   
  static Color backgroundColorDark1 =  Colors.blueGrey[900]!   ;   

  static Color textColorLight = Colors.black;
  static Color textColorDark = Colors.white;

  

  static final ThemeData darkTheme = ThemeData.dark().copyWith(

        // color primario
        primaryColor: AppTheme.primaryDark,
        primaryColorLight: AppTheme.backgroundColorDark,
        primaryColorDark: AppTheme.backgroundColorDark1,    
        dialogBackgroundColor: Colors.black54,        
        shadowColor: Colors.white24,

         textTheme: const TextTheme(
           
           bodyText1:   TextStyle( color: Colors.white ,fontWeight: FontWeight.normal, fontSize: 15  ),
           bodyText2:   TextStyle( color: Colors.white ),     
           

           headline1:   TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),          
           headline2:   TextStyle(fontSize: 30, fontWeight: FontWeight.w300, color: Colors.white ),          
           headline3:   TextStyle(fontSize: 25, fontWeight: FontWeight.w100, color: Colors.white ),  

        
  

         ),

        

        //appBar Theme
        appBarTheme: const AppBarTheme(
          color: AppTheme.primaryDark,

          elevation: 0,
        ) ,

    // TextButton Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom( primary: AppTheme.primaryDark )
    ),

    // FloatingActionButtons
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppTheme.primaryDark,
      elevation: 5
    ),

    // ElevatedButtons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
//        primary: Colors.indigo,
        primary: AppTheme.primaryDark,        
        
        shape: const StadiumBorder(),
        elevation: 0
      ),
    ),





    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle( color: AppTheme.primaryDark ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide( color: primaryDark ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10) , topRight: Radius.circular(10) ),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.primaryDark
            ),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10) , topRight: Radius.circular(10) ),
          ),
      border:OutlineInputBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10) , topRight: Radius.circular(10) ),
          ),

    )


   //     scaffoldBackgroundColor: Colors.black,

  );

//---------------------------------------------------------------------------------------------------------------------------------------

  static final ThemeData lightTheme = ThemeData.light().copyWith(

        // color primario
        primaryColor: AppTheme.primaryLight,

        primaryColorLight: AppTheme.backgroundColorLight,
        primaryColorDark: AppTheme.backgroundColorLight1,
        dialogBackgroundColor: Colors.white60,        
        shadowColor: Colors.black12,        

         textTheme: const TextTheme(
           
           bodyText1:   TextStyle( color: Colors.black,fontWeight: FontWeight.normal, fontSize: 15   ),
           bodyText2:   TextStyle( color: Colors.black ),           

           headline1:   TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),          
           headline2:   TextStyle(fontSize: 25, fontWeight: FontWeight.w300, color: Colors.black),          
           headline3:   TextStyle(fontSize: 20, fontWeight: FontWeight.w100, color: Colors.black),          



         ),

        
        //appBar Theme
        appBarTheme: const AppBarTheme(
          color: AppTheme.primaryLight,
          elevation: 0,
        ) ,

    // TextButton Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom( primary: AppTheme.primaryLight )
    ),

    // FloatingActionButtons
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppTheme.primaryLight,
      elevation: 5
    ),

    // ElevatedButtons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppTheme.primaryLight,
        shape: const StadiumBorder(),
        elevation: 0
      ),
    ),


    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle( color: AppTheme.primaryLight ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide( color: AppTheme.primaryLight ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10) , topRight: Radius.circular(10) ),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.primaryLight
            ),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10) , topRight: Radius.circular(10) ),
          ),
      border:OutlineInputBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10) , topRight: Radius.circular(10) ),
          ),

    )


   //     scaffoldBackgroundColor: Colors.black,

      );




}

