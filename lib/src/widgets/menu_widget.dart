import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                color: Color(0xff77c9d4),
                image: DecorationImage(
                    image: AssetImage('assets/VIAJEROS.png'),
                    fit: BoxFit.contain)),
          ),
          ListTile(
            leading: Icon(Icons.home_rounded, color: Color(0xff015249)),
            title: Text('Inicio'),
            onTap: () => Navigator.pushReplacementNamed(context, 'home'),
          ),
          ListTile(
              leading: Icon(Icons.attractions, color: Color(0xff015249)),
              title: Text('Sitios Turísticos'),
              onTap: () => Navigator.pushReplacementNamed(context, 'sitios')),
          ListTile(
            leading: Icon(Icons.local_hotel, color: Color(0xff015249)),
            title: Text('Hospedaje'),
            onTap: () => Navigator.pushReplacementNamed(context, 'hospedaje'),
          ),
          ListTile(
            leading: Icon(Icons.food_bank_rounded, color: Color(0xff015249)),
            title: Text('Alimentación'),
            onTap: () =>
                Navigator.pushReplacementNamed(context, 'alimentacion'),
          ),
          ListTile(
              leading: Icon(Icons.directions_bus, color: Color(0xff015249)),
              title: Text('Transporte'),
              onTap: () => Navigator.pushNamed(context, 'transporte')),
          ListTile(
            leading: Icon(Icons.map_outlined, color: Color(0xff015249)),
            title: Text('Mapa del cantón'),
            onTap: () => Navigator.pushNamed(context, 'mapaGeneral'),
          ),
          ListTile(
            leading: Icon(Icons.info, color: Color(0xff015249)),
            title: Text('Acerca de Huaca'),
            onTap: () => Navigator.pushNamed(context, 'informacion'),
          ),
          ListTile(
            leading: Icon(Icons.policy, color: Color(0xff015249)),
            title: Text('Emergencias'),
            onTap: () => Navigator.pushNamed(context, 'emergencias'),
          ),
        ],
      ),
    );
  }
}
