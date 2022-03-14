

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/providers.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context).currentTheme;

    final backgroundColor1 = currentTheme.primaryColorLight;
    final backgroundColor2 = currentTheme.primaryColorDark;
    

    return Container(
      decoration:BoxDecoration(
        gradient: LinearGradient(colors: [
          backgroundColor1,
          backgroundColor2,
         ],
         begin: Alignment.bottomCenter,
         end: Alignment.topCenter,
         )
        ),

    );
  }
}