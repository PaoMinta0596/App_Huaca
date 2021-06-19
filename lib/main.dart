import 'package:app_atractivos/src/pages/abrir_enlace_page.dart';
import 'package:app_atractivos/src/pages/alimentacion_page.dart';
import 'package:app_atractivos/src/pages/detalle_alimentacion_page.dart';
import 'package:app_atractivos/src/pages/detalle_hospedaje_page.dart';
import 'package:app_atractivos/src/pages/detalle_transporte_page.dart';
import 'package:app_atractivos/src/pages/emergencias_page.dart';
import 'package:app_atractivos/src/pages/hospedaje_page.dart';
import 'package:app_atractivos/src/pages/informacion_page.dart';
import 'package:app_atractivos/src/pages/mapa_page.dart';
import 'package:app_atractivos/src/pages/sitios_page.dart';
import 'package:app_atractivos/src/pages/transporte_page.dart';
import 'package:flutter/material.dart';
import 'package:app_atractivos/src/bloc/provider.dart';
import 'package:app_atractivos/src/pages/detalle_sitio_page.dart';
import 'package:app_atractivos/src/pages/home_page.dart';
import 'package:app_atractivos/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'mapa': (BuildContext context) => MapaPage(),
          'home': (BuildContext context) => HomePage(),
          'sitios': (BuildContext context) => SitiosPage(),
          'detalleSitio': (BuildContext context) => DetalleSitioPage(),
          'hospedaje': (BuildContext context) => HospedajePage(),
          'detalleHospedaje': (BuildContext context) => DetalleHospedajePage(),
          'alimentacion': (BuildContext context) => AlimentacionPage(),
          'detalleAlimentacion': (BuildContext context) =>
              DetalleAlimentacionPage(),
          'transporte': (BuildContext context) => TransportePage(),
          'detalleTransporte': (BuildContext context) =>
              DetalleTransportePage(),
          'informacion': (BuildContext context) => InformacionPage(),
          'emergencias': (BuildContext context) => EmergenciasPage(),
          'abrirEnlace': (BuildContext context) => AbrirEnlace(),
        },
        theme: ThemeData(primaryColor: Color(0xff57BC90)),
      ),
    );
  }
}
