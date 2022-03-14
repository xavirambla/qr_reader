
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/providers.dart';


class CustomNavigationBar extends StatelessWidget {
  
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      items: const  [  // como mínimo 2 items
        BottomNavigationBarItem(
          icon:  Icon (Icons.map ),
          label:'Mapa'
           
        ),
        BottomNavigationBarItem(
          icon: Icon (Icons.compass_calibration ),
          label:'Direcciones'
        ),        
      ],
     ) ;
  }
}


          
