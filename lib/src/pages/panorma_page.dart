import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class PanoramaPage extends StatefulWidget {
  @override
  _PanoramaPageState createState() => _PanoramaPageState();
}

class _PanoramaPageState extends State<PanoramaPage> {
  double _lon = 0;
  double _lat = 0;
  double _tilt = 0;
  int _panoId = 0;
  List<Image> panoImages = [
    Image(
        image: NetworkImage(
            'https://res.cloudinary.com/dgn9qbfmo/image/upload/v1624138922/Columpios_de_don_Carapaz_1_wggqff.jpg')),
    Image(
        image: NetworkImage(
            'https://res.cloudinary.com/dgn9qbfmo/image/upload/v1624141377/Dante_House_1_yuptzn.jpg')),
    Image(
      image: NetworkImage(
          'https://res.cloudinary.com/dgn9qbfmo/image/upload/v1624141428/Guanderas_1_qkocfv.jpg'),
    )
  ];

  Widget hotspotButton({String text, IconData icon, VoidCallback onPressed}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(CircleBorder()),
            backgroundColor: MaterialStateProperty.all(Colors.black38),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: Icon(
            icon,
            size: 35.0,
          ),
          onPressed: onPressed,
        ),
        text != null
            ? Container(
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Center(child: Text(text)),
              )
            : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget panorama;
    panorama = Panorama(
      animSpeed: 0.5,
      sensorControl: SensorControl.AbsoluteOrientation,
      child: panoImages[_panoId % panoImages.length],
      hotspots: [
        Hotspot(
          latitude: 0.0,
          longitude: 160.0,
          width: 90.0,
          height: 75.0,
          widget: hotspotButton(
              text: "Siguiente",
              icon: Icons.double_arrow,
              onPressed: () => setState(() => _panoId++)),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba'),
      ),
      body: Stack(
        children: [
          panorama,
          Text(
              '${_lon.toStringAsFixed(3)}, ${_lat.toStringAsFixed(3)}, ${_tilt.toStringAsFixed(3)}'),
        ],
      ),
    );
  }
}
