import 'package:flutter/material.dart';
import 'package:qr_reader/themes/background_gradient.dart';


/*
 *  Esta clase sirve para devolver el Background principal de la pantalla
 * 
 */

class Background extends StatelessWidget {
 
   final Image? image;
   final IconData? icon;
   final String? text1;
   final String? text2;
   final String? text3;
   final int? option1;
   final int? option2;
   final int? option3;
   final Widget? body;
   final String? tag1;
   final String? tag2;
   final String? tag3;

/*
Estos parámetros sirven para configurar cualquier Widget de Background 
 */
   const Background ({Key? key, this.image, this.icon, this.text1, this.text2, this.text3, this.option1, this.option2, this.option3, this.body, this.tag1, this.tag2, this.tag3}) : super(key:  key);

   @override
   Widget build (BuildContext context){  
      return  BackgroundGradient( icon: icon, body: body,);
   }
}