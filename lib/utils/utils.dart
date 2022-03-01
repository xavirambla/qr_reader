
import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan ) async {
  final url = scan.valor ;
  if (scan.tipo == 'http'){
    //intentamos abrir el sitio web
    print("URL :" + url);
    if (await canLaunch( url )){
      await launch( url );
    }
    else {
      throw 'Could not launch $url';
    }
  }
  else {
    // le decimos de navegar a otra página
    Navigator.pushNamed(context,'mapa', arguments: scan);
  }
}


