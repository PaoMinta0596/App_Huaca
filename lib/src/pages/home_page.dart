import 'package:app_atractivos/src/preferencias_usuario.dart/preferencias_usuario.dart';
import 'package:app_atractivos/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = 'home';
    return Scaffold(
        appBar: AppBar(
          elevation: 4,
          title: Text('Inicio'),
        ),
        drawer: MenuWidget(),
        body: Container(
          child: Column(
            children: [_portada(context), _mensaje()],
          ),
        ));
  }

  // Widget _swiperFotos(BuildContext context) {
  //   final _screenSize = MediaQuery.of(context).size;
  //   return Container(
  //       padding: EdgeInsets.only(top: 0.0),
  //       width: double.infinity,
  //       height: 350.0,
  //       child: Swiper(
  //         layout: SwiperLayout.STACK,
  //         itemWidth: _screenSize.width * 0.8,
  //         itemHeight: _screenSize.height * 0.35,
  //         itemBuilder: (BuildContext context, int index) {
  //           return ClipRRect(
  //             borderRadius: BorderRadius.circular(20.0),
  //             child: FadeInImage(
  //               image: NetworkImage(fotos[index]),
  //               fit: BoxFit.fill,
  //               placeholder: AssetImage('assets/jar-loading.gif'),
  //             ),
  //           );
  //         },
  //         itemCount: fotos.length,
  //         pagination: new SwiperPagination(
  //           builder: DotSwiperPaginationBuilder(
  //               color: Color.fromRGBO(200, 200, 200, 1),
  //               size: 10.0,
  //               activeSize: 12.0),
  //         ),
  //       ));
  // }

  Widget _portada(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/portada.jpg',
        width: double.infinity,
      ),
    );
  }

  Widget _mensaje() {
    return Container(
      padding: EdgeInsets.all(40.0),
      width: double.infinity,
      child: Column(
        children: [
          Text('San Pedro de Huaca',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
          SizedBox(height: 30.0),
          Text(
            'Aquí podrás encontrar lugares mágicos e increíbles que tal vez aún no conozcas, es un cantón de espectacular ecosistema y jardines de frailejones en su páramo, se mantiene siempre vivo por sus fiestas y tradiciones de su gente, la cual se dedica en gran proporción a la actividad agropecuaria.',
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
