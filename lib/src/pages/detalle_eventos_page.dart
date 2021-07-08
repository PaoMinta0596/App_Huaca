import 'package:app_atractivos/src/models/eventos_model.dart';
import 'package:app_atractivos/src/utils/expandir_texto.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetalleEventosPage extends StatelessWidget {
  EventosModel evento = new EventosModel();
  @override
  Widget build(BuildContext context) {
    final EventosModel eveData = ModalRoute.of(context).settings.arguments;

    if (eveData != null) {
      evento = eveData;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Evento Programado'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              onPressed: () => Navigator.pushReplacementNamed(context, 'home'))
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _informacion() {
    return Container(
        margin: EdgeInsets.only(top: 250.0),
        padding:
            EdgeInsets.only(top: 5.0, bottom: 20.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            ListTile(
              title: Text('${evento.nombre}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
            ),
            ExpandableText(
              maxLines: 100,
              text: '${evento.descripcion}',
            ),
            Divider(),
            ListTile(
              dense: true,
              title: Text('Fecha', style: TextStyle(fontSize: 16)),
              subtitle: Text('${evento.fecha}', style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.calendar_today, color: Colors.blue),
              horizontalTitleGap: 0,
            ),
            Divider(),
            ListTile(
              dense: true,
              title: Text('Costo aproximado', style: TextStyle(fontSize: 16)),
              subtitle: Text('${evento.costo}', style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.attach_money_rounded, color: Colors.green),
              horizontalTitleGap: 0,
            ),
            Divider(),
            ListTile(
              dense: true,
              title: Text('Ubicación', style: TextStyle(fontSize: 16)),
              subtitle:
                  Text('${evento.ubicacion}', style: TextStyle(fontSize: 15)),
              leading: Icon(Icons.location_on, color: Colors.red),
              horizontalTitleGap: 0,
            ),
            Divider(),
          ],
        ));
  }

  Widget _mostrarFoto() {
    if (evento.imagenes != null) {
      return Container(
        margin: EdgeInsets.only(bottom: 50.0),
        child: FadeInImage(
            image: NetworkImage(evento.imagenes),
            placeholder: AssetImage('assets/jar-loading.gif'),
            height: 250.0,
            width: double.infinity,
            fit: BoxFit.cover),
      );
    } else {
      return Container(
        child: Image(
          image: AssetImage('assets/no-image.png'),
          height: 150.0,
          fit: BoxFit.cover,
        ),
      );
    }
  }
}
