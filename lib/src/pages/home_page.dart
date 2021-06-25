import 'package:app_atractivos/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  final fotos = [
    'https://res.cloudinary.com/dgn9qbfmo/image/upload/v1624047629/dante_jnw0qq.jpg',
    'https://res.cloudinary.com/dgn9qbfmo/image/upload/v1624047676/parque-purita_indymc.jpg',
    'https://res.cloudinary.com/dgn9qbfmo/image/upload/v1624047666/parque-central_sjjswt.jpg',
    'https://res.cloudinary.com/dgn9qbfmo/image/upload/v1624047651/letras-huaca_m5iz32.jpg',
    'https://res.cloudinary.com/dgn9qbfmo/image/upload/v1624047639/dante-house_qbms1t.jpg',
    'https://res.cloudinary.com/dgn9qbfmo/image/upload/v1621891835/santuario_wshu3e.jpg',
    'https://res.cloudinary.com/dgn9qbfmo/image/upload/v1624048103/IMG_20210605_121106_3_gkraar.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inicio'),
        ),
        drawer: MenuWidget(),
        body: Container(
          child: Column(
            children: [_swiperFotos(context), _mensaje()],
          ),
        ));
  }

  Widget _swiperFotos(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(top: 0.0),
        width: double.infinity,
        height: 350.0,
        child: Swiper(
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width * 0.8,
          itemHeight: _screenSize.height * 0.35,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(fotos[index]),
                fit: BoxFit.fill,
                placeholder: AssetImage('assets/jar-loading.gif'),
              ),
            );
          },
          itemCount: fotos.length,
          pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                color: Color.fromRGBO(200, 200, 200, 1),
                size: 10.0,
                activeSize: 12.0),
          ),
        ));
  }

  Widget _mensaje() {
    return Container(
      padding: EdgeInsets.all(25.0),
      width: double.infinity,
      child: Column(
        children: [
          Text('San Pedro de Huaca',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
          SizedBox(height: 20.0),
          Text(
            'Aquí podrás encontrar lugares mágicos e increíbles que tal vez aún no conozcas, es un cantón de espectacular ecosistema y jardines de frailejones en su páramo, se mantiene siempre vivo por sus fiestas y tradiciones.',
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
