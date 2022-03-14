import 'package:flutter/material.dart';
import 'package:qr_reader/providers/theme_provider.dart';
import 'package:qr_reader/share_preferences/preferences.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/themes/themes.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName ='Settings';

   const SettingsScreen ({Key? key}) : super(key:  key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
/*
  bool isDarkmode = Preferences.isDarkmode;
  int gender =1;
  String name= 'Pedro';
*/
   @override
   Widget build (BuildContext context){  
     const styleTitle = TextStyle( fontSize: 30,fontWeight: FontWeight.w500);
     double vheight = MediaQuery.of(context).size.height;

      return Scaffold(
        appBar: AppBar(
          title: const  Text('Settings'),
          ),
//          drawer: const SideMenu(),
         body: Stack(
           children:[
             //background
             const BackgroundGradient(), 
             //front
              SingleChildScrollView(   // recomendable cuando tienes cajas de texto, para evitar que el teclado puede tapar el widget
              
              child: Container(
                padding: const EdgeInsets.all(15),   // lo quitamos del containter interior para ponero a fuera y así  quedea más fino.
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,              
                  
                  children:[
                    const Text('Ajustes', style: styleTitle,),
                    const Divider(),
                    SwitchListTile(
                      value: Preferences.isDarkmode, 
                      title: const Text('Darkmode'),
                    onChanged:  ( value ){
                          Preferences.isDarkmode=value;
                          final themeProvider = Provider.of<ThemeProvider>(context,listen:false);
                          value 
                            ? themeProvider.setDarkmode() 
                            : themeProvider.setLightMode();
                          setState(() {      });
         
         
                    }
                    ),
                     SizedBox(height: vheight -300 ,),                               
                  //const Spacer(),
                  //Spacer(),
                  //Expanded(child: Container( ),),
                    const Text('Acerca de', style: styleTitle,),          
                    //const Textd ('Acerca De', style: styleTitle,),
                    const Divider(),                               
                    const Text("Xavi Rambla",  ), 
                    const SizedBox(height: 10,),
                    //const Text("Más información en www.xavirambla.net",  ), 
                    InkWell(
                        child: Row(
                          children:  const [
                            Text('Más información en ',),
                            Text('www.xavirambla.net', style: TextStyle( color: Colors.blueAccent ),),
                          ],
                        ),
                        onTap: () => launch('http://www.xavirambla.net')
         
                    ),
         
                  ]
                  ,),
              ),
           ),
           ]
         )

      );
   }
}

