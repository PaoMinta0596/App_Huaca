import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

abrirEnlace(BuildContext context, String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    // throw 'Could not launch $url';
    _mostrarAlert(context);
  }
}
//  => await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

void _mostrarAlert(BuildContext context) {
  showDialog(
    context: context,
    // barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: Text('Whatsapp'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Este sitio no dispone de whatsapp\n\n'),
            Image.asset(
              'assets/whatsapp.png',
              height: 60,
              width: 60,
            )
          ],
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Ok',
                style: TextStyle(fontSize: 20),
              )),
        ],
      );
    },
  );
}
