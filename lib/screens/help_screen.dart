import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/l10n/gen/app_localizations.dart';
import 'package:qr_reader/themes/background.dart';
import 'package:qr_reader/widgets/widgets.dart';

import '../providers/providers.dart';

class HelpScreen extends StatelessWidget {
   const HelpScreen ({Key? key}) : super(key:  key);

   @override
   Widget build (BuildContext context)  {  
      var   t = AppLocalizations.of(context);
      return  Scaffold(
        appBar: AppBar(
          title:  Text( t!.helpTitle ),
          ),        
         body: 
           const Background(
             body:  _Body()    ,
             icon: Icons.help_center_outlined                
           ),
         
      );
   }
}


class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
     var   t = AppLocalizations.of(context);

    return SingleChildScrollView(   // listview o singlechildScrolView
    child: Column(
      children:  [
        const SizedBox(height: 100,),
        CardContainer(
          paddinghorizontal: 15,
          
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,            
            children:  [
              _TitleAndDescription( title:"", description:  t!.help_description_1 ),
              _TitleAndDescription( title:"", description:  t.help_description_2 ),              
              _TitleAndDescription( title:"", description:  t.help_description_3 ),
              _TitleAndDescription( title:"", description:  t.help_description_4 ),
              _TitleAndDescription( title: t.help_title_5, description: t.help_description_5 ),

            ],
          )
                            
        ),
          const SizedBox(height: 50,),
      ],
    )
           );
  }
}


class _TitleAndDescription extends StatelessWidget {
  const _TitleAndDescription({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;

    return Column(            
      children: [
          if( title.isNotEmpty ) RichText(
          textAlign: TextAlign.left,
          text:TextSpan(
                style: currentTheme.textTheme.bodyText1,                
                children: <TextSpan>[
                   TextSpan(text: title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20 )),                                
                ],
            )
        ),  
        if( title.isNotEmpty ) const SizedBox(height: 8,),
        RichText(
          text:TextSpan(
                style: currentTheme.textTheme.bodyText1,
                children: <TextSpan>[
                   TextSpan(text: description ),              
                ],
            )
        ),
        const SizedBox(height: 20,),
      ],            
    );
  }
}


