import 'package:app_atractivos/src/models/eventos_model.dart';
import 'package:app_atractivos/src/providers/eventos_provider.dart';
import 'package:app_atractivos/src/search/search_eventos.dart';
import 'package:app_atractivos/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EventosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchEventos('Buscar eventos'),
                );
              })
        ],
      ),
      drawer: MenuWidget(),
      backgroundColor: Color(0xff57BC90),
      body: Center(
        child: EventosGrid(),
      ),
    );
  }
}

// ignore: must_be_immutable
class EventosGrid extends StatelessWidget {
  final gastronomiaProvider = new EventosProvider();
  String query = '';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: gastronomiaProvider.cargarEventos(query),
      builder:
          (BuildContext context, AsyncSnapshot<List<EventosModel>> snapshot) {
        if (snapshot.hasData) {
          final eventos = snapshot.data;
          return new StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: eventos.length,
            itemBuilder: (context, i) => _eventoItem(context, eventos[i]),
            staggeredTileBuilder: (i) =>
                new StaggeredTile.count(2, i.isEven ? 3 : 3),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _eventoItem(BuildContext context, EventosModel eve) {
    return InkWell(
        onTap: () =>
            Navigator.pushNamed(context, 'detalleEventos', arguments: eve),
        child: Card(
            margin: EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            clipBehavior: Clip.antiAlias,
            //elevation: 0.0,
            child: Column(children: [
              (eve.imagenes == null)
                  ? Image(image: AssetImage('assets/no-image.png'))
                  : FadeInImage(
                      image: NetworkImage(eve.imagenes),
                      placeholder: AssetImage('assets/jar-loading.gif'),
                      height: 200.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
              SizedBox(height: 5),
              Text('${eve.nombre}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
              ElevatedButton(
                child: Text('Más información',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.center),
                onPressed: () => Navigator.pushNamed(context, 'detalleEventos',
                    arguments: eve),
              )
            ])));
  }
}
