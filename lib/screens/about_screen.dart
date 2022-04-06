import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/l10n/gen/app_localizations.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/themes/themes.dart';
import 'package:qr_reader/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';


class AboutScreen extends StatelessWidget {
  const AboutScreen ({Key? key}) : super(key:  key);
 
   @override
   Widget build (BuildContext context)  {  
      var   t = AppLocalizations.of(context);
      return  Scaffold(
        appBar: AppBar(
          title:  Text( t!.aboutTitle ),
          ),        
         body: 
           const Background(
             body:  _Body()  ,
             icon: Icons.qr_code_2,

           ),
         
      );
   }
}

class _Body extends StatefulWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(   // listview o singlechildScrolView
    child: Column(
      children: const [
        SizedBox(height: 200,),
        CardContainer(
          child: _InfoForm()
        ),
          SizedBox(height: 50,),
      ],
    )
           );
  }
}

/*
Contiene los datos del formulario o ventana
 */
class _InfoForm extends StatefulWidget {
  
  const _InfoForm({ Key? key }) : super(key: key);

  @override
  State<_InfoForm> createState() => _InfoFormState();
}

class _InfoFormState extends State<_InfoForm> {
  String appName ="";
  String packageName = "";
  String version ="";
  String buildNumber= "";

  @override
  initState() {
    super.initState();
    initPlatformState();  // recuepro los datos de la app
  }
  
  initPlatformState() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appName       = packageInfo.appName;
    packageName   = packageInfo.packageName;
    version       = packageInfo.version  ;
    buildNumber   = packageInfo.buildNumber;    
    setState(() {   });

  }


   void launchURL(String url) async {
    
      if (await canLaunch(url)) {
          await launch(url);
      } else {
          throw 'Could not launch $url';
      }
  }


  RichText getRichText(String label, String value){
    final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;
    return RichText(
                          
                text: TextSpan(
                  style: currentTheme.textTheme.bodyText1,
                  children: <TextSpan>[
                    TextSpan(text: label ),
                    TextSpan(text: value, style: const TextStyle(fontWeight: FontWeight.bold)),
                ]                
                ),
              );
  }

  @override
  Widget build(BuildContext context) {
    
    var   t = AppLocalizations.of(context);
    final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;
    final buttonColor = currentTheme.primaryColor;

            
    return  Column(
          children: [
              const SizedBox(height: 10,),
              Text( appName, style: currentTheme.textTheme.headline1),
              const SizedBox(height: 10,),            
              getRichText(t!.version +' : ', version),
              const SizedBox(height: 10,),
              getRichText( t.buildNumber +' : ', buildNumber ),

              const SizedBox(height: 30,),
              getRichText('' , t.author ),
              const SizedBox(height: 10,),
              Text( t.copyright ),
              const SizedBox(height: 30,),



            MaterialButton(
              shape:  RoundedRectangleBorder( borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: buttonColor,
              child:  Container(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                child:  const Text( "xavirambla.net",
                  style:   TextStyle(color: Colors.white,  fontWeight: FontWeight.bold),)

              ),
      //si es false , no hay acción en onpressed,
      //en caso de true se activa la función
                onPressed:   () async {
                  launchURL('http://www.xavirambla.net');               
              }
              )
        ]                 
      );
      
    
  }
}


