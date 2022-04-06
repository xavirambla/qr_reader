import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/l10n/gen/app_localizations.dart';


import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/router/app_routes.dart';
import 'package:qr_reader/themes/themes.dart';
import 'package:qr_reader/widgets/widgets.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context, listen:false); // no queremos que se redibuje
   var   t = AppLocalizations.of( context );
       
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:  Text( t!.homeTitle    ) ,
        actions: [
          IconButton(
            onPressed: (){
              scanListProvider.borrarTodos();

            } , 
            icon: const Icon(Icons.delete_forever) ,
            tooltip: t.deleteAll ,
            ),
            const _PopupSettings(),       
        ],
        ),
      body: Stack(children: const [
          Background(),
         _HomePageBody()
          ]
         ),
        bottomNavigationBar:   CustomNavigationBar( items: getItemsForNavigationBar( t ) ) ,
        floatingActionButton: const ScanButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        
    );
  }


  List<BottomNavigationBarItem> getItemsForNavigationBar(  AppLocalizations t ){

    return  [  // como mínimo 2 items
        BottomNavigationBarItem(
          icon:  const Icon (Icons.map ),
          label:t.mapTitle 
           
        ),
        BottomNavigationBarItem(
          icon: const Icon (Icons.compass_calibration ),
          label: t.addressTitle
        ),        
      ];
  }
  
}

class _PopupSettings extends StatelessWidget {
  const _PopupSettings({
    Key? key,
  }) : super(key: key);

/*
 * Función que le pasamos las opciones y nos duevelve los popupMenuItems para poder ser usados
*/
  List<PopupMenuItem> _getMenuOptions( menuOptions, context ){
    final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;
    List<PopupMenuItem> resultado =[]; 
    for (var option in menuOptions){
      resultado.add(
        PopupMenuItem(
            child: Text( option.title ,style: currentTheme.textTheme.bodyText1, ),
            value: option.route ,
          )
      );

    }
    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    final menuOptions =  _getMenuOptions( AppRoutes.getMenuSettings( context ) ,context);


    return PopupMenuButton( 
      itemBuilder: (context) { 
        return menuOptions;
        },              
      onSelected: ( choice) {  
//          print(choice);   //cuidado en caso de no existir el screen de la route entonces aparecerá pantalla negra
          Navigator.pushNamed(context, choice.toString() );
      } ,
 //             child: CircleAvatar(
      child: const ClipOval(
        child:  Icon(Icons.settings) ,
   //           )
    ),  );
  }
}



class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    /*
    final temp = new ScanModel(id : null, valor: 'http://www.xavirambla.es');
     DBProvider.db.nuevoScan(temp);
     
     DBProvider.db.getScanById(1).then((scan)=>print('ID: 1  - ${scan.id} -${scan.valor}' ));
     DBProvider.db.getScanById(4).then((scan)=>print('ID: 4  - ${scan.id} -${scan.valor}' ));

     DBProvider.db.getTodosLosScans().then( print );  // pinta el resultado
    
    DBProvider.db.getScanById(1)
      .then((scan) {
        scan.valor="http://www.sport.es";
        DBProvider.db.updateScan(scan);
       })
   .catchError((onError){
      print("Error catch1  $onError");
    });       

    DBProvider.db.deleteAllScans(  );
    print("--------------");
     DBProvider.db.getTodosLosScans().then( print );  // pinta el resultado

    DBProvider.db.getScanById(1)
    .then( print )
    .catchError((onError){
      print("Error catch2   $onError");
    });
*/

     

      //obtenemos el selected menu opt
      final uiProvider  = Provider.of<UiProvider>(context);
//      final currentIndex =0;  // cambiar para mostrar la página
      final currentIndex = uiProvider.selectedMenuOpt;
      
      //usar el scanListProvider
      final scanListProvider = Provider.of<ScanListProvider>(context, listen:false); // no queremos que se redibuje

      switch ( currentIndex){
        case 0:
          scanListProvider.cargarScansPorTipo('geo');
          return AppRoutes.getScreen('mapas');
          //return const MapasScreen();

        case 1:

          scanListProvider.cargarScansPorTipo('http');
          return AppRoutes.getScreen('direccion');
          // return DireccionesScreen();
          
        default:
          return AppRoutes.getScreen('mapas');
        //  return MapasScreen();
      }

   // return Container();
  }
}



