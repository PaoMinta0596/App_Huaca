import 'package:app_atractivos/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  final fotos = [
    'assets/home/guanderas.jpg',
    'assets/home/parque-purita.jpg',
    'assets/home/huaca-noche.jpg',
    'assets/home/dante-house.jpg',
    'assets/home/dante.jpg',
    'assets/home/letras-huaca.jpg',
    'assets/home/paramo.jpg',
    'assets/home/parque-central.jpg',
    'assets/home/purita-dia.jpg',
    'assets/home/santuario.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Página de Inicio'),
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
              child: Image.asset(fotos[index], fit: BoxFit.fill),
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
            'Aquí podrás encontrar lugares mágicos e increíbles que tal vez aún no conozcas, es un cantón de espectacular ecosistema y abierto páramo son sus jardines de frailejones, se mantiene siempre vivo por sus fiestas y tradiciones de su gente.',
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
