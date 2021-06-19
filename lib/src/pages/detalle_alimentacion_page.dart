import 'package:app_atractivos/src/models/alimentacion_model.dart';
import 'package:app_atractivos/src/models/hospedaje_model.dart';
import 'package:app_atractivos/src/utils/expandir_texto.dart';
import 'package:app_atractivos/src/utils/utils.dart';

import 'package:flutter/material.dart';

class DetalleAlimentacionPage extends StatelessWidget {
  AlimentacionModel alimentacion = new AlimentacionModel();
  @override
  Widget build(BuildContext context) {
    final AlimentacionModel aliData = ModalRoute.of(context).settings.arguments;

    if (aliData != null) {
      alimentacion = aliData;
    }
    return Scaffold(
      backgroundColor: Color.fromRGBO(105, 124, 55, 1.0),
      appBar: AppBar(
        title: Text('${alimentacion.nombre}'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              onPressed: () => Navigator.pushNamed(context, 'home'))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          //padding: EdgeInsets.all(15.0),
          child: Form(
            child: Stack(
              children: [
                _mostrarFoto(),
                _informacion(),
                _tarjetaIconos(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _informacion() {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 300.0),
        padding:
            EdgeInsets.only(top: 50.0, bottom: 20.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            ExpandableText(
              maxLines: 100,
              text: '${alimentacion.descripcion}',
            ),
            Divider(),
            ListTile(
              dense: true,
              title: Text('Horario', style: TextStyle(fontSize: 16)),
              subtitle: Text('${alimentacion.horario}',
                  style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.timer_rounded, color: Colors.blue),
              horizontalTitleGap: 0,
            ),
            Divider(),
            ListTile(
              dense: true,
              title: Text('Ubicación', style: TextStyle(fontSize: 16)),
              subtitle: Text('${alimentacion.ubicacion}',
                  style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.location_on, color: Colors.red),
              horizontalTitleGap: 0,
            ),
            Divider(),
            ListTile(
              dense: true,
              title: Text('Menú', style: TextStyle(fontSize: 16)),
              subtitle:
                  Text('${alimentacion.menu}', style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.menu_book_outlined, color: Colors.green),
              horizontalTitleGap: 0,
            ),
            Divider(),
            ListTile(
              dense: true,
              title: Text('Teléfono', style: TextStyle(fontSize: 16)),
              subtitle: Text('${alimentacion.telefono}',
                  style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.phone, color: Colors.blueAccent),
              horizontalTitleGap: 0,
            ),
            Divider(),
          ],
        ));
  }

  Widget _mostrarFoto() {
    if (alimentacion.imagenes != null) {
      return Container(
        margin: EdgeInsets.only(bottom: 50.0),
        child: FadeInImage(
            image: NetworkImage(alimentacion.imagenes),
            placeholder: AssetImage('assets/jar-loading.gif'),
            height: 300.0,
            fit: BoxFit.cover),
      );
    } else {
      return Container(
        child: Image(
          image: AssetImage('assets/no-image.png'),
          height: 300.0,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  Widget _tarjetaIconos(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 80.0,
        vertical: 270.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      elevation: 10.0,
      child: Container(
        //color: Color(0xff77C9D4),
        decoration: BoxDecoration(
          color: Color.fromRGBO(165, 165, 175, 0.5),
          borderRadius: BorderRadius.circular(30.0),
          //color: Colors.blue[100],
        ),
        height: 55.0,
        padding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(Icons.map, color: Colors.indigo, size: 30),
                onPressed: () => Navigator.pushNamed(context, 'mapa',
                    arguments: alimentacion.coordenadas)),
            IconButton(
                icon: Image.asset('assets/facebook.png', width: 28),
                onPressed: () => abrirEnlace(alimentacion.facebook)),
            IconButton(
                icon: Image.asset('assets/whatsapp.png', height: 28),
                onPressed: () => abrirEnlace(alimentacion.whatsapp)),
          ],
        ),
      ),
    );
  }
}
