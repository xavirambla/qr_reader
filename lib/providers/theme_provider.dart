import 'package:flutter/material.dart';
import 'package:qr_reader/themes/app_theme.dart';


class ThemeProvider extends ChangeNotifier{
  ThemeData currentTheme;

//  ThemeProvider({ required bool isDarkmode}): currentTheme= isDarkmode ? ThemeData.dark() : ThemeData.light();
  ThemeProvider({ required bool isDarkmode}): currentTheme= isDarkmode ? AppTheme.darkTheme : AppTheme.lightTheme;

  setLightMode(){
    
    // currentTheme = ThemeData.light();    
    currentTheme = AppTheme.lightTheme;
    notifyListeners();
  }
  setDarkmode(){
    //currentTheme = ThemeData.dark();
    currentTheme = AppTheme.darkTheme;
    notifyListeners();
  }

  
  
}