import 'package:app_atractivos/src/models/gastronomia_model.dart';
import 'package:app_atractivos/src/providers/gastronomia_provider.dart';
import 'package:app_atractivos/src/search/search_gastronomia.dart';
import 'package:app_atractivos/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GastronomiaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gastronomía del Cantón'),
        centerTitle: true,
        elevation: 4,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchGastronomia('Buscar platos gastronómicos'),
                );
              })
        ],
      ),
      drawer: MenuWidget(),
      body: Center(
        child: GastronomiaGrid(),
      ),
    );
  }
}

// ignore: must_be_immutable
class GastronomiaGrid extends StatelessWidget {
  final gastronomiaProvider = new GastronomiaProvider();
  String query = '';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: gastronomiaProvider.cargarGastronomia(query),
      builder: (BuildContext context,
          AsyncSnapshot<List<GastronomiaModel>> snapshot) {
        if (snapshot.hasData) {
          final gastronomia = snapshot.data;
          return new StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: gastronomia.length,
            itemBuilder: (context, i) =>
                _gastronomiaItem(context, gastronomia[i]),
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

  Widget _gastronomiaItem(BuildContext context, GastronomiaModel gast) {
    return InkWell(
        onTap: () =>
            Navigator.pushNamed(context, 'detalleGastronomia', arguments: gast),
        child: Card(
            margin: EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            clipBehavior: Clip.antiAlias,
            elevation: 20.0,
            child: Column(children: [
              (gast.imagenes == null)
                  ? Image(image: AssetImage('assets/no-image.png'))
                  : FadeInImage(
                      image: NetworkImage(gast.imagenes),
                      placeholder: AssetImage('assets/jar-loading.gif'),
                      height: 200.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
              SizedBox(height: 5),
              Text('${gast.nombre}',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              ElevatedButton(
                child: Text('Más información',
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.center),
                onPressed: () => Navigator.pushNamed(
                    context, 'detalleGastronomia',
                    arguments: gast),
              )
            ])));
  }
}
