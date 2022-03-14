import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/router/app_routes.dart';
import 'package:qr_reader/themes/themes.dart';
import 'package:qr_reader/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context, listen:false); // no queremos que se redibuje

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:  const Text('Historial') ,
        actions: [
          IconButton(
            onPressed: (){
              scanListProvider.borrarTodos();

            } , 
            icon: const Icon(Icons.delete_forever) 
            ),
          IconButton(
            onPressed: (){
              
              Navigator.pushNamed(context, 'settings');
            //  scanListProvider.borrarTodos();

            } , 
            icon: const Icon(Icons.settings) 
            )            
        ],
        ),
      body: Stack(children: const [
          BackgroundGradient(),
         _HomePageBody()
          ]
         ),
        bottomNavigationBar: const  CustomNavigationBar() ,
        floatingActionButton: const ScanButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        
    );
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
