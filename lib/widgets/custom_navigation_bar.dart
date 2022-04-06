
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/providers.dart';


class CustomNavigationBar extends StatelessWidget {
   final List<BottomNavigationBarItem> items;
  const CustomNavigationBar({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context ) {
    final uiProvider  = Provider.of<UiProvider>(context);
    final primaryColor = Provider.of<ThemeProvider>(context).currentTheme.primaryColor;
    
    final currentIndex = uiProvider.selectedMenuOpt;


    return BottomNavigationBar(
      onTap: ( int i) {
        uiProvider.selectedMenuOpt = i;
     //   print('opt: $i');
      },
      currentIndex: currentIndex,  //indica el elmento seleccionado
      selectedIconTheme: IconThemeData( color:primaryColor ),
      selectedItemColor:  primaryColor ,
      elevation:0,
      items: items,
     ) ;
  }
}


          
