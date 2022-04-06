import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/providers.dart';

class CardContainer extends StatelessWidget {
  final Widget child; 
  final double paddinghorizontal ;

  const CardContainer({ 
    Key? key, 
    this.paddinghorizontal=60 ,
    required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.symmetric( horizontal: paddinghorizontal ),
      child: Container(
        width: double.infinity,
        padding:  const EdgeInsets.all( 40 ),
        decoration: _createCardShape( context),
        child: child,
        
        
      ),
    );
  }

  BoxDecoration _createCardShape( context ) {
    final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;

    return BoxDecoration(

    color: currentTheme.dialogBackgroundColor,
    borderRadius: BorderRadius.circular(25),
    //sombreado
    boxShadow:  [      
      BoxShadow(
        color: currentTheme.shadowColor,
        blurRadius: 15,
        offset: const Offset( 0,5)
        )
      

    ]
  );
  }
}
