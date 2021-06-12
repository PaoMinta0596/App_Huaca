import 'package:app_atractivos/src/models/sitio_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MapaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SitiosModel sitio = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('Coordenadas Geográficas'),
          actions: [
            IconButton(icon: Icon(Icons.my_location), onPressed: () {})
          ],
        ),
        body: FlutterMap(
          options: MapOptions(
            center: sitio.getLatLng(),
            zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/paominta20/ckpj3cisf2ij217qqoa0ipzu4/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicGFvbWludGEyMCIsImEiOiJja3BoZzllczMwZmwzMm9wZWphYWRxNzEyIn0.a91z3N5f-oaRPTnn9qnCoQ",
                additionalOptions: {
                  'accessToken':
                      'pk.eyJ1IjoicGFvbWludGEyMCIsImEiOiJja3BoZzllczMwZmwzMm9wZWphYWRxNzEyIn0.a91z3N5f-oaRPTnn9qnCoQ',
                  'id': 'mapbox.mapbox-streets-v8'
                }),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: sitio.getLatLng(),
                  builder: (ctx) => Container(
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 45,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
