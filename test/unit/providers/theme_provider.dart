
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/themes/app_theme.dart';


void main() {

  group ("Theme Provider" , () {

    test ('Create in DarkMode' , ()  {
      ThemeProvider themeProvider = ThemeProvider(isDarkmode: true);
      expect(themeProvider.currentTheme , AppTheme.darkTheme );
    });

    test ('Create in LightMode' , ()  {
      ThemeProvider themeProvider = ThemeProvider(isDarkmode: false);
      expect(themeProvider.currentTheme , AppTheme.lightTheme );
    });

    test ('set LightMode' , ()  {
      //Arrange
      ThemeProvider themeProvider = ThemeProvider(isDarkmode: true);
      //Act
      themeProvider.setLightMode();
      //assert
      expect(themeProvider.currentTheme , AppTheme.lightTheme );
    });

    test ('set DarkMode' , ()  {
      //Arrange
      ThemeProvider themeProvider = ThemeProvider(isDarkmode: false);
      //Act
      themeProvider.setDarkmode();
      //assert
      expect(themeProvider.currentTheme , AppTheme.darkTheme );
    });




  });

    }      