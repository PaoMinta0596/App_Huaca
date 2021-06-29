import 'package:app_atractivos/src/models/sitio_model.dart';
import 'package:app_atractivos/src/widgets/menu_widget.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:app_atractivos/src/providers/sitios_provider.dart';

class MapaGeneralPage extends StatefulWidget {
  @override
  _MapaGeneralPageState createState() => _MapaGeneralPageState();
}

class _MapaGeneralPageState extends State<MapaGeneralPage> {
  List<SitiosModel> sitios;

  final sitiosProvider = new SitiosProvider();

  List<Marker> todosMarcadores = [];

  @override
  void initState() {
    crearMarcadores();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('holaaaa');
    return Scaffold(
        appBar: AppBar(
          title: Text('Coordenadas Geográficas'),
          actions: [
            IconButton(icon: Icon(Icons.my_location), onPressed: () {})
          ],
        ),
        drawer: MenuWidget(),
        body: _crearMapa());
  }

  Widget _crearMapa() {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(0.6236749161623997, -77.71109013484904),
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
          markers: todosMarcadores,
        ),
      ],
    );
  }

  Future crearMarcadores() async {
    sitios = await sitiosProvider.buscarSitios('');
    print(sitios.length);

    for (var i = 0; i < sitios.length; i++) {
      print(sitios[i].coordenadas);
      var imagen;

      if (sitios[i].categoria == 'Naturales') {
        imagen = 'assets/pinNaturales.png';
      } else {
        if (sitios[i].categoria == 'Culturales') {
          imagen = 'assets/pinCulturales.png';
        } else {
          if (sitios[i].categoria == 'Religiosos') {
            imagen = 'assets/pinReligiosos.png';
          }
        }
      }

      final lalo = sitios[i].coordenadas.substring(0).split(',');
      final lat = double.parse(lalo[1]);
      final lng = double.parse(lalo[0]);
      todosMarcadores.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(lat, lng),
          builder: (ctx) => GestureDetector(
            onTap: () {
              // Mostrar uma SnackBar quando clicar em um marcador
              Scaffold.of(ctx).showSnackBar(SnackBar(
                  content: ListTile(
                      onTap: () => Navigator.pushNamed(context, 'detalleSitio',
                          arguments: sitios[i]),
                      title: Text(
                        sitios[i].nombre,
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: Image.network(sitios[i].imagenes),
                      subtitle: Text(sitios[i].horario,
                          style: TextStyle(color: Colors.white)))));
            },
            child: Container(
              child: Image(image: AssetImage('$imagen')),
            ),
          ),
        ),
      );
    }

    setState(() {});
  }
}
