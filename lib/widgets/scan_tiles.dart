import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/utils/utils.dart';



class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({
    Key? key, 
    required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans =scanListProvider.scans; 
    final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;

    return ListView.builder(
      itemCount: scans.length ,
      itemBuilder: ( _, i)  =>Dismissible(  // PErmite sacar el elemento
        key: UniqueKey(), // cuando queremos una key que no vamos a utilizar nunca
        background: Container(
          color: Colors.red
          
          ),
          onDismissed: (DismissDirection direction)  // acción de cuando saca el
          {
           // scanListProvider.borrarScanPorId(scans[i].id) como no queremos redibujar, esto estaría mal
           Provider.of<ScanListProvider>(context, listen:false)
              .borrarScanPorId( scans[i].id!  );
          },
        child: ListTile(
          leading: Icon (Icons.map, color: Theme.of(context).primaryColor),
          title: Text(scans[i].valor, style:  currentTheme.textTheme.bodyText1 ),
          //subtitle: Text( scans[i].id.toString()  ),
          trailing: const Icon (Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () {
            launchURL(context, scans[i] );
            
            /*
              final eliminame = scans[i];
              scanListProvider.borrarScanPorId( eliminame.id!);
      */
      
          },
          ),
      )    
      );

  }
  
}